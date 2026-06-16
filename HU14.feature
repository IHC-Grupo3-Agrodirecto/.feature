Feature: Cancelación de publicación de carga
  Como productor agrícola
  Deseo retirar mi oferta de carga
  Para dejar de recibir ofertas si ya vendí el producto localmente

  Scenario: Cancelación exitosa de publicación
    Given que el productor está en "Mis Publicaciones"
    And ve una carga publicada que no desea enviar
    When presiona "Cancelar publicación"
    Then aparece confirmación: "¿Estás seguro de cancelar?"
    And después de confirmar, la carga desaparece de las búsquedas
    And los transportistas ya no ven esa oferta
    And recibe notificación: "Publicación cancelada correctamente"

  Scenario: Notificación a transportistas interesados
    Given que una carga ya tiene 3 transportistas interesados
    When el productor cancela la publicación
    Then se notifica automáticamente a los 3 transportistas:
      | Notificación                         |
      | La carga ha sido cancelada           |
      | El productor ha retirado su oferta   |