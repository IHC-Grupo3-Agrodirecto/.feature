Feature: Algoritmo de agrupación automática de cargas
  Como sistema de AgroDirecto
  Deseo agrupar cargas pequeñas en un radio de 5km
  Para formar un lote de viaje eficiente y reducir costos

  Scenario: Consolidación automática exitosa
    Given que existen pedidos atomizados en el sistema:
      | Productor    | Ubicación          | Peso  | Producto | Fecha recojo |
      | Juan Pérez   | Lurín (km 25)      | 300kg | Papa     | 20/05/2025   |
      | María García | Lurín (km 26)      | 400kg | Papa     | 20/05/2025   |
      | Pedro López  | Lurín (km 27)      | 500kg | Papa     | 20/05/2025   |
    When el sistema ejecuta el algoritmo de consolidación
    And detecta que coinciden en zona (radio 5km) y fecha
    Then agrupa automáticamente los 3 pedidos
    And crea lote consolidado de 1,200 kg
    And asigna transportista compatible
    And notifica a los 3 productores:
      | Notificación                                |
      | "Tu carga ha sido consolidada"             |
      | "Lote final: 1,200 kg"                     |
      | "Ahorro estimado: S/ 45"                   |
      | "Tu camión sale hoy a las 14:00 hrs"       |

  Scenario: No consolidación por distancia
    Given que existen 2 cargas en el mismo radio
    When no hay dos o más cargas en el mismo radio de 5 km
    And el sistema intenta agruparlas
    Then detecta diferencia en la distancia
    And rechaza automáticamente la consolidación
    And muestra: "Productos no consolidados"
