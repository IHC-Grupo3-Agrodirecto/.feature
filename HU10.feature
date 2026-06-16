Feature: Marcación de ubicación GPS del acopio
  Como productor agrícola
  Quiero marcar mi ubicación exacta en el mapa
  Para que el camión llegue directo a mi chacra sin perderse

  Scenario: Guardar coordenadas GPS automáticamente
    Given que el productor está registrando una carga
    When presiona el ícono de ubicación
    And el dispositivo tiene GPS activado
    Then se capturan automáticamente las coordenadas
    And aparece un marcador en el mapa: "Tu acopio"
    And muestra la dirección aproximada: "Lurín, Lima"

  Scenario: Marcar ubicación manualmente sin GPS
    Given que el productor está registrando una carga
    And el dispositivo no tiene GPS activado
    When presiona "Marcar ubicación"
    Then aparece un mapa interactivo
    And puede arrastra el pin hasta su ubicación exacta
    And presiona "Confirmar ubicación"
    Then las coordenadas se guardan correctamente