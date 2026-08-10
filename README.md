# 2026_Butternut_Health_Data_Management
Data management process for @HobanLab butternut health assessment data. 
[Reference Github Repo](https://github.com/HobanLab/Butternut)

## Description
This repository documents the data management necessary for the butternut health assessment data spanning from Summer 2024 to Summer 2026 (as of writing). 

The health assessments [evolved considerably](https://docs.google.com/document/d/15MV2UUqgxR9c2eEpp-V7zLcjA9GGJhMaZdKkgN2rZSM/edit?tab=t.0#heading=h.kb53jp3xdu8f) over time, leading to inconsistencies in what data was collected, how the data was collected, and the meaning behind the collected data. 

Here, we document the data processing, merging, quality control, and cleaning conducted to account for the form's evolution. The following R Scripts produce two homogenized datasets for data collected from 2024 onward and a separate one for 2025 onward.


Figure 1. Pipeline of data management steps taken to prepare the butternut health assessment data from 2024 to 2026. 

## Folder Descriptions
**data_2024**: Parent folder for data management of the final combined 2024 and onward dataset. Includes processing and integration of separate photo data, merging with 2025 and more.  

**data_2025&on**: Parent folder for data management of the final combined 2025 and onward dataset. Includes separate pipelines for processing the June/July 2025 data and August & On 2025, as these two datasets are distinct. Then merging from there. 

**output_data**: Outputted datasets across the data management process. 

**source_data**: Raw datasets before any data management, including raw 2024 data, separate data of 2024 photo information, raw June/July 2025 data, and raw August & Onward 2025 data.

**Images**: This folder contains images generated for the present Github README.

