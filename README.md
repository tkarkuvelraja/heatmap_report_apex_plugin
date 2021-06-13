# Oracle APEX Plug-In: Heat Map Report

It's a Heat Map (or heatmap) Report Plug-In. It's a representation of data where values are depicted by color. It makes the visualize of complex data easy and understand it at a glance.

**This has been inspired by apex.oracle.com. Special thanks to Oracle APEX Product Development team, who brought this solution.**

Demo Application: https://apex.oracle.com/pls/apex/f?p=113036:9999::BRANCH_TO_PAGE_ACCEPT::9999:P9999_APP_PAGE_REDIRECT:36

# Prerequisite:

**DB versions:**	12.1.0.1,12.2.0.1,18.4.0.0,19.0.0.0.0,19.2.0.0.19,21.0.0.0.0,21.1.0.0.0,21.1.0.0.1

**APEX versions**	20.1.0.00.13,20.2.0.00.20,21.1.0

# Installation:

Export plugin file **"region_type_plugin_orclking_heatmap_report.sql"** from Source directory and import it into your application.

# Steps to Achieve:

**Step 1:** Export a script **"Script to Populate Sample Data.sql"** from directory and compile it in your schema.

**Step 2:** Create a new blank page.

**Step 3:** Export plugin file **"region_type_plugin_orclking_heatmap_report.sql"** from Source directory and import it into your application.

**Navigation:** Shared Components ==> Plug-ins ==> Import

![image](https://user-images.githubusercontent.com/85283603/121553504-60ffae80-ca22-11eb-9f7c-6650009226df.png)

Plugin will be listed under plug-ins bucket after successful installation.

![image](https://user-images.githubusercontent.com/85283603/121553428-4f1e0b80-ca22-11eb-886e-2f9dc88c3635.png)

**Step 4:** Create a region to the page. Change region type to **Heat Map Report [Plug-In]**.

![image](https://user-images.githubusercontent.com/85283603/121554230-09157780-ca23-11eb-870e-2c6616f9cdb0.png)

**Step 5:**  Construct Oracle SQL query and copy and paste it in region SQL Query section.

![image](https://user-images.githubusercontent.com/85283603/121554183-f9962e80-ca22-11eb-9710-563c1c07e7a0.png)

**Query Template:**

    SELECT 1 heat_map_id, -- Primary key of the Table
       
           'Product A' heatmap_tootltip,
              
            apex_string.get_initials('Product A',6) heatmap_label, -- Initials
              
            apex_util.prepare_url ('f?p='||:app_id||':1:'||:app_session||':::1:P1_ID:'||1) heatmap_link,
              
            1000 heatmap_value -- Note: It must be a number field
              
      FROM dual
              
     WHERE 1 = 1;
        
       
**Sample Query to Render a Report:**

**Note:** Populate sample data by exporting a script **"Script to Populate Sample Data.sql"** from directory and compile it in your schema.

    WITH final_data AS
        
    (SELECT dt.dept_id,
         
            count(*) total_tasks
           
      FROM dept_tasks dt

     GROUP BY dt.dept_id
     )
       SELECT dept.dept_id heat_map_id, -- Primary key of the Table
       
              dept.dept_name heatmap_tootltip,
              
              apex_string.get_initials(dept.dept_code,6) heatmap_label, -- Initials
              
              apex_util.prepare_url ('f?p='||:app_id||':1:'||:app_session||':::1:P1_ID:'||1) heatmap_link,
              
              fd.total_tasks heatmap_value -- Note: It must be a number field
              
         FROM department_master dept,
         
              final_data fd
              
        WHERE 1 = 1
        
          AND dept.dept_id = fd.dept_id
          
        ORDER BY fd.total_tasks DESC;
 
 **Output:** Then you output would display like this,

![image](https://user-images.githubusercontent.com/85283603/121629801-03547c00-ca8d-11eb-8e47-ede1c7c31648.png)
  
That's it.

Happy APEXing!!!...

# References:

https://apex.oracle.com
