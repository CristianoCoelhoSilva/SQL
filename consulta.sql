select valor, replace(concat(substr(data_serie, 7, 4), '-', substr(data_serie, 4, 3), substr(data_serie, 1, 2)),'/','-') data, indice, name
  from (
select data_serie, indice, TRIM(replace(valor, '_Index', '')) valor
 from test.tab_valores_serie
where indice not like '%A%') serie
inner join (
select name, TRIM(replace(COD_INDEX, 'Index', '')) valor
  from test.tab_infos
) infos
using (valor)
