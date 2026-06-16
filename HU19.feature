Feature: Cálculo y división de flete proporcional al peso
  Como sistema de AgroDirecto
  Quiero dividir el costo total del viaje proporcionalmente al peso
  Para que cada productor pague exactamente lo justo

  Scenario Outline: Cálculo proporcional de costos
    Given que un camión se llena con múltiples cargas:
      | Productor    | Peso   | Peso proporcional |
      | <productor>  | <peso> | <proporcion>      |
    And el costo total del viaje es S/ 360
    When se cierra el viaje
    Then el sistema divide el costo proporcionalmente:
      | Productor        | Peso  | Proporción | Costo asignado |
      | Juan Pérez       | 300kg | 25%        | S/ 90          |
      | María García     | 400kg | 33%        | S/ 120         |
      | Pedro López      | 500kg | 42%        | S/ 150         |

    Examples:
      | productor       | peso  | proporcion |
      | Juan Pérez      | 300kg | 25%        |
      | María García    | 400kg | 33%        |
      | Pedro López     | 500kg | 42%        |

  Scenario: Validación del cálculo proporcional
    Given que se finaliza un viaje consolidado
    When el sistema genera cobros
    Then cada cobro incluye:
      | Detalle de cobro                            |
      | Tarifa base del flete                       |
      | Porcentaje de peso que transportaste        |
      | Descuento por consolidación (X%)            |
      | Comisión de AgroDirecto (3-5%)             |
      | Monto final a pagar                         |
    And aparece verificación: "Los costos suman exactamente el total"