SELECT pays.Zone, annee.Annee, sum(indicateur_co2_ch4.Emission_de_CO2)/population_totale as emission_totale_de_CO2_Par_Habitant 
FROM faopollution.indicateur_co2_ch4,faopollution.pays, faopollution.produit, faopollution.annee, faopollution.population
where pays.CodeZone=indicateur_co2_ch4.CodeZone and produit.CodeProduit=indicateur_co2_ch4.CodeProduit
and annee.CodeAnnee=indicateur_co2_ch4.CodeAnnee and pays.CodeZone=population.CodeZone and annee.CodeAnnee=population.CodeAnnee and Annee=2019
group by Zone, Annee having Zone not in ('Afrique', 'Europe','Asie','Amériques','Chine Continentale', 'Monde')
order by emission_totale_de_CO2_Par_Habitant desc
Limit 8;