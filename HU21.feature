Feature: Aviso de "Último Cupo"
  Como sistema,
  Quiero notificar espacios mínimos disponibles en camiones (ej. 200 kg libres),
  Para que productores pequeños puedan aprovechar el hueco de carga.

  Scenario Outline: Alerta de último cupo a agricultores con cargas mínimas
    Given que un camión se encuentra al 95% de su capacidad con <espacio-libre> kg libres
    When queda poco espacio disponible en el camión
    Then el sistema debe alertar a los agricultores cuya carga registrada sea menor o igual a <carga-maxima> kg mostrando el aviso de <tipo-alerta>
    Examples: Espacios disponibles y umbrales de alerta
      | espacio-libre | carga-maxima | tipo-alerta              |
      | 200           | 200          | "Último cupo disponible" |
      | 180           | 180          | "Último cupo disponible" |

  Scenario Outline: No mostrar alerta cuando la carga del productor supera el espacio libre
    Given que un camión tiene solo <espacio-libre> kg libres disponibles
    When un productor con una carga registrada de <carga-productor> kg busca un viaje
    Then el sistema NO debe mostrar la alerta de <tipo-alerta> para ese agricultor
    Examples: Cargas que exceden el espacio disponible
      | espacio-libre | carga-productor | tipo-alerta              |
      | 150           | 300             | "Último cupo disponible" |
      | 100           | 250             | "Último cupo disponible" |