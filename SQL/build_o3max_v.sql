SELECT
	MAX(O3) as O3,
	ANY_VALUE(geom) as geom
FROM 
	`predicting-o3.EPAO3.o3monthlymax`
GROUP BY
	state,
	county
;