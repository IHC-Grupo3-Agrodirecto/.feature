Feature: Visualización del historial de cargas publicadas
  Como productor agrícola
  Deseo ver mis envíos realizados
  Para llevar un control de mi volumen comercializado en el mes

  Scenario: Visualización de envíos previos completos
    Given que el productor accede a su dashboard
    When abre la sección "Mis Envíos"
    Then visualiza el detalle de todas las cargas consolidadas:
      | Información              |
      | Fecha de envío           |
      | Destino                  |
      | Peso en kg               |
      | Transportista asignado   |
      | Costo total              |
      | Estado del envío         |

  Scenario Outline: Filtrado de envíos por período
    Given que el productor está en la sección "Mis Envíos"
    When selecciona el filtro de período:
      | Período               | Resultado                |
      | <periodo>             | <numero_envios>          |
    Then el sistema muestra solo las cargas realizadas en ese período
    And actualiza el total de kg vendidos: "<total_kg> kg"
    And suma el ahorro total: "S/ <ahorro_total>"

    Examples:
      | periodo           | numero_envios | total_kg | ahorro_total |
      | Últimos 7 días    | 3             | 1200     | 180          |
      | Últimos 30 días   | 12            | 5000     | 850          |
      | Últimos 3 meses   | 28            | 12500    | 2100         |