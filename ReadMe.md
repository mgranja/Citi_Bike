# Tableau Homework
## Citi_Bike Analytics

Data was extracted from the [Citi Bike Data](https://www.citibikenyc.com/system-data) site.
Multiple files were concatenated in python using glob library. 

```python
from glob import iglob
import pandas as pd

path = r'../Tableau/data/*.csv'


all_rec = iglob(path, recursive=True)     
dataframes = (pd.read_csv(f) for f in all_rec)
big_dataframe = pd.concat(dataframes, ignore_index=True)
```
Minor cleaning was completed in Python and then exported as a .csv into PostgreSQL.
Data was cleaned further and tables were finalized for Tableau.  
Things like nonsensical birth years were removed and additional fields were added to show actual age.  Also added was a  quarter field to display the reporting quarter. 
Here is an example of a case statement used in PostgreSQL.

```sql

Update clean_bikes
	Set quarter = CASE 
	when date_part('month', starttime) in (1, 2, 3) then 'QTR1'
	when date_part('month', starttime) in (4, 5, 6) then 'QTR2'
	when date_part('month', starttime) in (7, 8, 9) then 'QTR3'
	when date_part('month', starttime) in (10, 11,12) then 'QTR4' 
	END 

```
In Tableau, several worksheets were created to build dashboards and a story.
The visualizations focused on Quarter 1 2018 data. They display the type of Citi_Bike users, their ages and gender.  There are also visualizations about average trip duration, most used bikes, breakouts by weekdays and the most/least used stations.

The story provides a visual display of the first quarter of the year.  It showcases a profile of typical rider based on demographical data collected.  Their behavior can be read and used as opportunities to see how to add value to the areas that are not as strong.  For example, how can the number of rides increase on low days such as Mondays?  The story also shows the most used bikes.  This can be an area to further monitor and see if it can prevent costly maintenance in the future.  Lastly, the least used stations should also be monitored to see if there is a further growth.  

 [Tableau story](https://public.tableau.com/views/HW_Citi_Bike/Story1?:embed=y&:display_count=yes&publish=yes&:origin=viz_share_link)

