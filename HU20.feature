Feature: Asignación de cargas por prioridad de cercanía
  Como sistema de AgroDirecto
  Deseo asignar cargas que estén en la misma vía principal
  Para evitar desvíos innecesarios al transportista

  Scenario: Consolidación priorizando ruta principal
    Given que un transportista tiene capacidad disponible
    And existen 3 cargas en su radio:
      | Carga            | Ubicación           | Distancia de desvío |
      | Carga A          | Ruta principal Lurín| 0 km (en ruta)      |
      | Carga B          | Zona lateral        | 3 km de desvío      |
      | Carga C          | Ruta principal      | 0 km (en ruta)      |
    When el algoritmo ejecuta consolidación
    Then prioriza Cargas A y C (ruta principal)
    And sugiere: "Estas 2 cargas están en tu ruta sin desvío"
    And descarta Carga B: "Requiere 3 km de desvío"
    And notifica al productor de Carga B: "Tu carga se consolidará con el próximo viaje principal"

  Scenario Outline: Validación de desvíos aceptables
    Given que existe una carga fuera de ruta principal
    When el desvío es:
      | Desvío  | Decisión del sistema                           |
      | <desvio>| <decision>                                     |
    Then el sistema actúa según tolerancia:
      | Acción                                     |
      | <accion>                                   |

    Examples:
      | desvio | decision                       | accion                                       |
      | 0-1 km | Aceptable                      | Se incluye en consolidación automáticamente  |
      | 1-3 km | Considerar si llena camión    | Se pregunta al transportista                 |
      | 3+ km  | No aceptable                   | Se busca transportista alternativo           |
