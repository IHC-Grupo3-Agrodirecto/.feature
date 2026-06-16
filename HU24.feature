Feature: Priorización de cargas perecibles en consolidación
  Como sistema,
  Quiero consolidar primero las cargas con fecha de vencimiento más próxima,
  Para evitar mermas en el campo.

  Scenario Outline: Asignación prioritaria según fecha de vencimiento más cercana
    Given que la cola de espera tiene <numero-cargas> cargas para un camión con espacio limitado
    When el sistema evalúa las fechas de vencimiento de cada carga
    Then debe asignar primero el <producto-prioritario> con vencimiento en <horas-vencimiento> horas por encima de <producto-postergado>
    Examples: Comparación de prioridad entre productos
      | numero-cargas | producto-prioritario | horas-vencimiento | producto-postergado |
      | 5             | "Frutilla"           | 24                | "Papa seca"         |
      | 5             | "Tomate"             | 18                | "Cebolla"           |

  Scenario Outline: Visualización de etiqueta de prioridad para cargas críticas
    Given que una carga de <producto-perecible> tiene vencimiento en <horas-vencimiento> horas
    When el transportista visualiza la oferta consolidada disponible
    Then el sistema debe mostrar la etiqueta <tipo-etiqueta> sobre esa carga para identificarla como prioritaria
    Examples: Etiquetas de alerta por perecibilidad crítica
      | producto-perecible | horas-vencimiento | tipo-etiqueta                  |
      | "Fresas"           | 12                | "Prioritario - Perecible"      |
      | "Lechuga"          | 8                 | "Prioritario - Perecible"      |