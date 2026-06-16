Feature: Especificación de tipo de cultivo perecible o seco
  Como productor agrícola
  Deseo especificar si mi carga es perecible o seca
  Para que se me asigne el transporte adecuado y seguro

  Scenario: Filtrado de transportistas para carga perecible
    Given que el productor está publicando una carga
    When selecciona el tipo de producto "Perecible" (frutas, verduras frágiles)
    And presiona "Siguiente"
    Then el sistema filtra y muestra solo transportistas con:
      | Requisito                      |
      | Cámaras refrigeradas           |
      | Temperatura controlada         |
      | Experiencia con perecederos    |
    And le muestra 8 opciones de transporte

  Scenario: Mostrar todos los transportistas para producto seco
    Given que el productor está publicando una carga
    When selecciona el tipo de producto "Seca" (maíz, papa almacenada)
    And presiona "Siguiente"
    Then el sistema muestra todos los transportistas disponibles
    And sin restricción de refrigeración
    And aparecen 23 opciones de transporte