-- Total desistentes

SELECT
    COUNT(*) AS Dropout_Count
FROM
    Data
WHERE
    Target = 'Dropout'

-- Perfil dos estudantes desistentes

SELECT
    CASE 
        WHEN Gender = 1 THEN 'Male' 
        WHEN Gender = 0 THEN 'Female' 
    END AS Gender,
    CASE
        WHEN Marital_status = 1 THEN 'Single'
        WHEN Marital_status = 2 THEN 'Married'
        WHEN Marital_status = 3 THEN 'Widower'
        WHEN Marital_status = 4 THEN 'Divorced'
        WHEN Marital_status = 5 THEN 'Facto Union'
        WHEN Marital_status = 6 THEN 'Legally Separeted'
    END AS Marital_Status,
    AVG(Age_at_enrollment) AS Avg_Age,
    COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS Count
FROM
    Data
WHERE
    Target = 'Dropout'
GROUP BY
    Gender,
    Marital_status
ORDER BY
    Count DESC, Marital_Status

-- Taxa Geral de Evasão

SELECT 
    CONCAT(ROUND((CAST(COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS FLOAT) / 
            COUNT(*)) * 100,2), '%') AS Dropout_rate
FROM 
    Data

-- Taxa Evasão por Gênero

SELECT
    CASE 
        WHEN Gender = 1 THEN 'Male' 
        WHEN Gender = 0 THEN 'Female' 
    END AS Gender,
    CONCAT(ROUND((CAST(COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS FLOAT) / 
            COUNT(*)) * 100,2), '%') AS Dropout_rate,
    COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS Dropout_Count
FROM 
    Data
GROUP BY
    Gender

-- Taxa de evasão por Estado Civil

SELECT
    CASE
        WHEN Marital_status = 1 THEN 'Single'
        WHEN Marital_status = 2 THEN 'Married'
        WHEN Marital_status = 3 THEN 'Widower'
        WHEN Marital_status = 4 THEN 'Divorced'
        WHEN Marital_status = 5 THEN 'Facto Union'
        WHEN Marital_status = 6 THEN 'Legally Separeted'
    END AS Marital_Status,
    CONCAT(ROUND((CAST(COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS FLOAT) / 
                    COUNT(*)) * 100,2),'%') AS Dropout_rate,
    COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS Dropout_count
FROM 
    Data
GROUP BY
    Marital_status
ORDER BY
    Dropout_rate DESC

-- Idade mínima e máxima dos desistentes

SELECT
    MIN(Age_at_enrollment) AS Min_Age,
    MAX(Age_at_enrollment) AS Max_Age
FROM
    Data
WHERE
    Target = 'Dropout'

-- Faixa etária dos desistentes

SELECT
    Age_Group,
    CONCAT(ROUND((CAST(COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS FLOAT) / 
            COUNT(*)) * 100,2), '%') AS Dropout_rate,
    COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS Dropout_count
FROM (
SELECT
    Age_at_enrollment,
    Target,
    CASE
        WHEN Age_at_enrollment BETWEEN 18 AND 29 THEN '18-29'
        WHEN Age_at_enrollment BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age_at_enrollment BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age_at_enrollment BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS Age_Group
    FROM Data) AS Subquery
GROUP BY 
    Age_Group
ORDER BY 
    Age_Group


-- Taxa de evasão diferentes turnos

SELECT
    CASE
        WHEN Daytime_evening_attendance = 0 THEN 'Evening'
        ELSE 'Daytime'
    END AS Daytime_evening_attendance,
    CONCAT(ROUND((CAST(COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS FLOAT) / 
            COUNT(*)) * 100,2), '%') AS Dropout_rate,
    COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS Dropout_count
FROM 
    Data
GROUP BY
    Daytime_evening_attendance
ORDER BY
    Dropout_rate DESC

-- Taxa evasão diferentes cursos

SELECT
    CASE 
        WHEN Course = 33 THEN 'Biofuel Production Technologies'
        WHEN Course = 171 THEN 'Animation and Multimedia Design'
        WHEN Course = 8014 THEN 'Social Service (evening attendance)'
        WHEN Course = 9003 THEN 'Agronomy'
        WHEN Course = 9070 THEN 'Communication Design'
        WHEN Course = 9085 THEN 'Veterinary Nursing'
        WHEN Course = 9119 THEN 'Informatics Engineering'
        WHEN Course = 9130 THEN 'Equinculture'
        WHEN Course = 9147 THEN 'Management'
        WHEN Course = 9238 THEN 'Social Service'
        WHEN Course = 9254 THEN 'Tourism'
        WHEN Course = 9500 THEN 'Nursing'
        WHEN Course = 9556 THEN 'Oral Hygiene'
        WHEN Course = 9670 THEN 'Advertising and Marketing Management'
        WHEN Course = 9773 THEN 'Journalism and Communication'
        WHEN Course = 9853 THEN 'Basic Education'
        WHEN Course = 9991 THEN 'Management (evening attendance)'
        ELSE 'Unknown Course'
    END AS Course,
    CONCAT(ROUND((CAST(COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS FLOAT) / 
                    COUNT(*)) * 100,2), '%') AS Dropout_rate,
    COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS Dropout_count
FROM
    Data
GROUP BY
    Course
ORDER BY Dropout_rate DESC

-- Taxa evasão estudantes internacionais/nacionais, com/sem bolsa de estudos e com/sem mensalidades atrasadas

SELECT
   CASE
        WHEN International = 1 THEN 'Yes'
        ELSE 'No'
    END AS International,
    CASE
        WHEN Tuition_fees_up_to_date = 1 THEN 'Yes'
        ELSE 'No'
    END AS Tuition_fees_up_to_date,
    CASE
        WHEN Scholarship_holder = 0 THEN 'No'
        ELSE 'Yes'
    END AS Scholarship_holder,
    CONCAT(ROUND((CAST(COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS FLOAT) / 
            COUNT(*)) * 100,2), '%') AS Dropout_rate,
    COUNT(CASE WHEN target = 'Dropout' THEN 1 END) AS Dropout_count   
FROM
    Data
GROUP BY
    Tuition_fees_up_to_date, 
    Scholarship_holder,
    International
ORDER BY 
    Dropout_rate DESC
