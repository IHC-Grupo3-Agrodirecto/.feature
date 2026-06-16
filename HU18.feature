Feature: Sugerencia de ahorro por fletes en ruta
  Como productor agrícola
  Deseo ver fletes que pasan por mi ruta
  Para unirme a ellos y pagar menos que un flete solo

  Scenario: Visualización de fletes sugeridos
    Given que el productor tiene una carga publicada
    And busca opciones de transporte disponibles
    When abre la sección "Transportistas disponibles"
    Then el sistema le sugiere fletes en ruta que pasan por su zona:
      | Transportista    | Ruta                    | Ahorro estimado |
      | Roberto Campos   | Lurín → Mayorista       | S/ 45           |
      | Luis Martínez    | Cañete → Lima Centro    | S/ 60           |
      | Carlos Rodríguez | Lurín → Distribuidora   | S/ 50           |

  Scenario Outline: Detalles de flete sugerido
    Given que el sistema sugiere un flete
    When el productor presiona en uno
    Then aparece tarjeta con información:
      | Campo                   | Detalle                    |
      | <campo>                 | <detalle>                  |
    And muestra: "Ahorrarás aproximadamente <ahorro> al unirte"
    And botón: "Unirme a este flete"

    Examples:
      | campo                   | detalle                    | ahorro  |
      | Transportista           | Roberto Campos (4.9★)      | S/ 45   |
      | Camión                  | Volvo FH16 - Placa ABC-1234| S/ 45   |
      | Horario de recojo       | Hoy a las 14:00 hrs        | S/ 45   |
      | Destino                 | Mercado Mayorista Lima     | S/ 45   |
      | Capacidad actual        | 15/18 toneladas (83%)      | S/ 45   |