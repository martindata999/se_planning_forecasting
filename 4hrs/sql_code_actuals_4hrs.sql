SELECT [DimDateStart],
    ([Numerator] / [Denominator]) AS [4hrs]
FROM (
    SELECT [DimDateStart], [MeasureType], [Value]
    FROM [UDALLakeMart_PATPlanningReporting].[actual_data_2526_1]
    WHERE [RegionCode] = 'Y59'
    AND [PlanningRef] = 'E.M.13'
    AND [MeasureType] IN ('Numerator', 'Denominator')
) AS SourceTable
PIVOT (
    SUM([Value]) FOR [MeasureType] IN ([Numerator], [Denominator])
) AS pvt;