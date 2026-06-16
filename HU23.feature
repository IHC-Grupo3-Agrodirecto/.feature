Feature: Estimación de tiempo de llegada a puntos de acopio
  Como sistema,
  Quiero calcular la hora de llegada a cada punto de acopio,
  Para que el productor esté listo cuando el camión arribe.

  Scenario Outline: Envío de hora estimada de recojo a cada agricultor
    Given que una ruta tiene <numero-paradas> paradas programadas
    When el sistema suma las distancias y los tiempos de carga de cada punto
    Then debe enviar la hora estimada de recojo de <tipo-notificacion> a cada agricultor correspondiente
    Examples: Configuraciones de ruta y notificación
      | numero-paradas | tipo-notificacion              |
      | 4              | "Hora estimada de llegada"     |
      | 6              | "Hora estimada de llegada"     |

  Scenario Outline: Actualización de hora de recojo ante retraso del transportista
    Given que una ruta activa tiene estimaciones de recojo ya enviadas a los productores
    When el transportista acumula un retraso de <minutos-retraso> minutos por <causa-retraso>
    Then el sistema debe actualizar la hora de recojo y notificar con el mensaje <tipo-notificacion> a los productores pendientes de las siguientes paradas
    Examples: Casos de retraso y notificación
      | minutos-retraso | causa-retraso  | tipo-notificacion                          |
      | 30              | "Tráfico"      | "Su hora de recojo ha sido actualizada"    |
      | 15              | "Desvío"       | "Su hora de recojo ha sido actualizada"    |