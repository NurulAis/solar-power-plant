# ⚡ Solar Power Plant Analysis & Forecasting

This project focuses on analyzing, cleaning, and modeling solar power plant data to uncover insights, detect anomalies in inverter performance, and forecast future energy output using time series techniques. It integrates SQL-based preprocessing with advanced analysis in Python.

---

## 📁 Dataset Overview

The dataset contains operational and environmental data from two solar power plants collected between **May 15, 2020 and June 17, 2020**. It includes generator data (DC and AC power), sensor data (temperature, irradiation), and energy yield metrics.

---

## 🧹 Data Cleaning Workflow

Initial data cleaning was performed using **SQL (PostgreSQL)** for performance and precision. Key steps:

- **Data type conversion** for proper datetime and numerical formats
- **Joining** generator and sensor tables into a unified dataset
- **Data loaded into Python** using SQLAlchemy for further analysis

---

## 🎯 Objectives

- Perform exploratory data analysis to uncover patterns and relationships
- Detect anomalies in **inverter efficiency** over time
- Identify important features influencing energy production
- Predict energy output 3 days ahead using **time series forecasting**

---

## 🔍 Analysis Highlights

### 📊 Exploratory Data Analysis (EDA)
- Time-series plots of DC/AC power and yields
- KDE plots to assess distribution of `daily_yield`
- Scatter plots comparing inverter outputs across plants
- Correlation analysis of environmental and energy metrics

### ⚠️ Anomaly Detection
- Calculated inverter efficiency (`ac_power / dc_power`)
- Used statistical thresholds and rolling windows to identify unusually low-efficiency periods
- Flagged potential underperformance cases for investigation

### 🌟 Feature Importance
- Analyzed the impact of key variables (e.g., **irradiation**, **temperature**) on energy production.  
- Utilized **XGBoost feature importance** and **SHAP values** to interpret model decisions.  
- Visualized feature contributions to understand which factors drive **daily yield** variations.  
- Insights support targeted improvements in system design and performance optimization.

### 🔮 Time Series Forecasting
- Forecasted **daily yield** to support short-term energy generation planning.  
- Explored temporal patterns such as **daily trends and seasonality**.  
- Built predictive models using **XGBoost**, leveraging time-based features like `hour` and `day of week`.  
- Forecast results help identify production fluctuations and optimize operational efficiency.

---

## 🧪 Tools & Libraries

- **PostgreSQL + SQLAlchemy** – Data cleaning, joins, and database access
- **Python** – Main analysis environment
- **Pandas, NumPy** – Data wrangling and transformation
- **Matplotlib, Seaborn** – Visualization
- **Scikit-learn, SHAP** – Modeling and feature analysis
- **XGBoost** – Time series modeling

---

## 💡 Key Insights

- **Plant 1** consistently produces higher DC Power than Plant 2 (≈1196% higher), likely due to differences in panel type, area, cleanliness, and sunlight intensity.
- Despite higher DC Power, **Plant 1's inverter efficiency is critically low (~10%)**, indicating significant energy loss during DC-to-AC conversion.
- **Plant 2** shows better inverter performance, with DC and AC Power values closely aligned, reflecting a high inverter **efficiency averaging around 97%**, which indicates efficient and stable energy conversion and delivery.
- Module temperatures are consistently higher than ambient temperatures, reflecting normal solar panel operation and energy absorption. Maximum module temperatures (around 37–38°C) remain within safe limits but may slightly reduce efficiency. Ambient temperatures are relatively stable, indicating no extreme weather conditions, while lower temperature days correlate with reduced energy output.
- Time series forecasting of **daily yield** reveals consistent daily patterns.
- Feature analysis using **SHAP** and **Random Forest Regressor** indicates that **irradiation** and **ambient temperature** are major drivers of energy yield.

---

## ✅ Recommendations

- Conduct a thorough technical inspection and maintenance of Plant 1’s inverter to improve conversion efficiency and reduce energy loss.
- Perform regular cleaning and upkeep of solar panels on both plants to maintain optimal DC power output.  
- Monitor module and ambient temperatures to prevent efficiency drops, especially during high-temperature periods.  
- Utilize time series forecasting results to plan short-term energy production and maintenance schedules effectively.  
- Incorporate feature importance insights (irradiation and ambient temperature) into operational strategies

---

## 🗂 Project Structure
📁 project/
├── dataset/
│ ├── Plant_1_Generation_Data.csv
│ ├── Plant_1_Weather_Sensor_Data.csv
│ ├── Plant_2_Generation_Data.csv
│ └── Plant_2_Weather_Sensor_Data.csv
├── notebooks/
│ └── analysis.ipynb
├── sql/
│ ├── create_generator_table.sql
│ ├── create_sensor_table.sql
│ ├── data_cleaning.sql
│ └── simple_analysis_queries.sql
└── README.md
