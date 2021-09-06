SELECT pays.Zone, annee.Annee, sum(indicateur_no2_ind_no2.Emission_de_N2O)/population_totale as emission_totale_de_N2O_Par_Habitant 
FROM faopollution.indicateur_no2_ind_no2,faopollution.pays, faopollution.produit, faopollution.annee, faopollution.population
where pays.CodeZone=indicateur_no2_ind_no2.CodeZone and produit.CodeProduit=indicateur_no2_ind_no2.CodeProduit
and annee.CodeAnnee=indicateur_no2_ind_no2.CodeAnnee and pays.CodeZone=population.CodeZone and annee.CodeAnnee=population.CodeAnnee and Annee=2019
group by Zone, Annee having Zone not in ('Afrique', 'Europe','Asie','Amériques','Chine Continentale', 'Monde')
order by emission_totale_de_N2O_Par_Habitant desc