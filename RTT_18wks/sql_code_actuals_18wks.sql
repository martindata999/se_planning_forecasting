SELECT [DimDateStart],
    ([E.B.40] / [E.B.3a]) AS [18wks]
FROM (
    SELECT [DimDateStart], [PlanningRef], [Value]
    FROM [UDALLakeMart_PATPlanningReporting].[actual_data_2526_1]
    WHERE [RegionCode] = 'Y59'
    AND [PlanningRef] IN ('E.B.40', 'E.B.3a')
    AND [DimDateStart] >= '2022-10-01'
) AS SourceTable
PIVOT (
    SUM([Value]) FOR [PlanningRef] IN ([E.B.40], [E.B.3a])
) AS pvt;