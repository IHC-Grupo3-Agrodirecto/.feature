Feature: Visualización y aceptación de cargas de retorno
  Como transportista,
  Quiero ver pedidos disponibles que regresan al campo desde Lima,
  Para no viajar con el camión vacío de vuelta.

  Scenario Outline: Visualización de insumos disponibles en sección de cargas de retorno
    Given que el transportista ha llegado al mercado mayorista de <punto-llegada>
    When consulta la sección "Cargas de retorno" en la plataforma
    Then debe visualizar una lista de <tipo-insumo> disponibles para llevar a provincia con su <detalle-carga>
    Examples: Insumos disponibles por punto de llegada
      | punto-llegada        | tipo-insumo    | detalle-carga                        |
      | "Mercado de Lima"    | "Semillas"     | "Peso, destino y hora de recojo"     |
      | "Mercado de Lima"    | "Abono"        | "Peso, destino y hora de recojo"     |
      | "Mercado de Lima"    | "Fertilizantes"| "Peso, destino y hora de recojo"     |

  Scenario Outline: Bloqueo de capacidad de retorno al aceptar carga con destino a provincia
    Given que el transportista acaba de descargar en <punto-descarga> y tiene <capacidad-retorno> toneladas libres de vuelta
    When acepta una carga de retorno de <tipo-insumo> con destino a <destino-provincia>
    Then el sistema debe bloquear <capacidad-usada> toneladas de la capacidad de retorno y mostrar el estado <estado-retorno> confirmando que el camión no viajará vacío
    Examples: Cargas de retorno aceptadas y bloqueo de capacidad
      | punto-descarga    | capacidad-retorno | tipo-insumo | destino-provincia | capacidad-usada | estado-retorno          |
      | "Lima"            | 8.0               | "Semillas"  | "Huancayo"        | 3.0             | "Retorno con carga"     |
      | "Lima"            | 6.0               | "Abono"     | "Ayacucho"        | 2.5             | "Retorno con carga"     |