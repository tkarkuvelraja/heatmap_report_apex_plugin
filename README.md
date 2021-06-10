# Oracle APEX Plug-In: Heat Map Report

It's a Heat Map (or heatmap) Report Plug-In. It's a representation of data where values are depicted by color. It makes the visualize of complex data easy and understand it at a glance.

Demo Application: https://apex.oracle.com/pls/apex/f?p=113036:9999::BRANCH_TO_PAGE_ACCEPT::9999:P9999_APP_PAGE_REDIRECT:36

# Prerequisite:

**DB versions:**	12.1.0.1,12.2.0.1,18.4.0.0,19.0.0.0.0,19.2.0.0.19,21.0.0.0.0,21.1.0.0.0,21.1.0.0.1

**APEX versions**	20.1.0.00.13,20.2.0.00.20,21.1.0

# Installation:

Export plugin file **"region_type_plugin_orclking_heatmap_report.sql"** from Source directory and import it into your application.

# Steps to Achieve:

**Step 1:** Create required objects (table, sequence, trigger) and populate sample data into a table. (As per your requirements)

**Step 2:** Create a new blank page.

**Step 3:** Export plugin file **"region_type_plugin_orclking_heatmap_report.sql"** from Source directory and import it into your application.

**Navigation:** Shared Components ==> Plug-ins ==> Import

![image](https://user-images.githubusercontent.com/85283603/120700684-fe0e9480-c4c2-11eb-8307-733c2d5f31a9.png)


Plugin will be listed under plug-ins bucket after successful installation.

![image](https://user-images.githubusercontent.com/85283603/120700299-8c364b00-c4c2-11eb-8934-bb59163ffd0f.png)


**Step 4:** Create a region to the page. Change region type to **Heat Map Report [Plug-In]**.

![image](https://user-images.githubusercontent.com/85283603/120700160-5b561600-c4c2-11eb-91e8-9e39af042775.png)

**Step 5:**  Construct Oracle SQL query and copy and paste it in region SQL Query section.

![image](https://user-images.githubusercontent.com/85283603/120698476-2d6fd200-c4c0-11eb-93c8-5b7db96ccd55.png)

**Query Format:**

       SELECT 1 heat_map_id -- Primary key of the Table 

              'Product A' heatmap_tootltip,

               apex_string.get_initials('Product A',4) heatmap_label, -- Initials

               apex_util.prepare_url ('f?p='||:APP_ID||':1:'||:APP_SESSION||':::1:P1_ID:'||1) heatmap_link,

               1000 heatmap_value -- Note: It must be a number field

       FROM   oracle_table 

       WHERE  1 = 1;

 **Output:** Then you output would display like this,

![image](https://user-images.githubusercontent.com/85283603/120699282-40cf6d00-c4c1-11eb-8376-1981610462ac.png)

  
That's it.

Happy APEXing!!!...

# References:

https://apex.oracle.com
