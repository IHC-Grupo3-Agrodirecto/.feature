Feature: Filtro de cargas por tonelaje máximo del camión
  Como transportista,
  Quiero filtrar cargas según el peso máximo de mi unidad,
  Para no perder tiempo en pedidos que no puedo llevar.

  Scenario Outline: Ocultamiento automático de cargas que superan la capacidad del camión
    Given que el camión del transportista tiene una capacidad máxima registrada de <capacidad-camion> toneladas
    When el transportista aplica el filtro de búsqueda por tonelaje
    Then el sistema debe ocultar automáticamente todas las cargas superiores a <capacidad-camion> toneladas y mostrar solo las cargas de <rango-visible>
    Examples: Capacidades de camión y rangos de carga visibles
      | capacidad-camion | rango-visible            |
      | 10               | "1 a 10 toneladas"       |
      | 7                | "1 a 7 toneladas"        |

  Scenario Outline: Visualización de badge de filtro activo en pantalla de resultados
    Given que el transportista se encuentra en la pantalla de resultados de búsqueda
    When el filtro por tonelaje está activo con un límite de <capacidad-camion> toneladas
    Then el sistema debe mostrar el badge <tipo-badge> indicando el filtro vigente sobre los resultados
    Examples: Badges de filtro activo por capacidad
      | capacidad-camion | tipo-badge                      |
      | 10               | "Filtro activo: ≤ 10 toneladas" |
      | 7                | "Filtro activo: ≤ 7 toneladas"  |