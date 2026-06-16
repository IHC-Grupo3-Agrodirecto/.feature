Feature: Bitácora de gastos del viaje
  Como transportista,
  Quiero anotar mis gastos de peajes y comida durante el viaje,
  Para conocer mi ganancia neta real tras el flete.

  Scenario Outline: Descuento automático de gastos sobre los ingresos brutos del viaje
    Given que el transportista se encuentra en la sección "Mis Gastos" del viaje con ingresos brutos de <ingresos-brutos> soles
    When ingresa un monto de <gasto-peajes> soles por peajes y <gasto-comida> soles por comida
    Then el sistema debe restar automáticamente el total de <total-gastos> soles de los ingresos brutos y mostrar una ganancia neta de <ganancia-neta> soles
    Examples: Combinaciones de gastos y ganancia neta resultante
      | ingresos-brutos | gasto-peajes | gasto-comida | total-gastos | ganancia-neta |
      | 800             | 50           | 30           | 80           | 720           |
      | 600             | 40           | 20           | 60           | 540           |

  Scenario Outline: Visualización del resumen de ganancia neta al cerrar el viaje
    Given que el transportista tiene un viaje finalizado con ingresos de <ingresos-brutos> soles y gastos registrados de <total-gastos> soles
    When el transportista cierra el viaje en la plataforma
    Then el sistema debe mostrar el resumen <tipo-resumen> con la ganancia neta calculada
    Examples: Resúmenes de cierre de viaje por ganancia neta
      | ingresos-brutos | total-gastos | tipo-resumen                  |
      | 800             | 120          | "Ganancia neta: S/ 680"       |
      | 600             | 60           | "Ganancia neta: S/ 540"       |