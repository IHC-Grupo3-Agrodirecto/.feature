Feature: Visualización de espacio disponible en tiempo real
  Como transportista,
  Quiero visualizar en tiempo real mis toneladas libres,
  Para aceptar pedidos mientras voy en ruta.

  Scenario Outline: Visualización del gráfico de capacidad durante viaje en curso
    Given que el transportista tiene un viaje en curso con <capacidad-total> toneladas de capacidad total
    When abre su panel de control en la plataforma
    Then debe visualizar un gráfico de barras que muestre <capacidad-utilizada> toneladas utilizadas versus <capacidad-ociosa> toneladas libres en tiempo real
    Examples: Estados de capacidad del camión en ruta
      | capacidad-total | capacidad-utilizada | capacidad-ociosa |
      | 10              | 7.5                 | 2.5              |
      | 8               | 5.0                 | 3.0              |

  Scenario Outline: Actualización automática del gráfico al aceptar una nueva carga
    Given que el transportista tiene el panel de capacidad abierto con <espacio-libre> toneladas libres
    When acepta una nueva carga de <nueva-carga> toneladas
    Then el gráfico debe actualizarse automáticamente mostrando <espacio-resultante> toneladas libres sin necesidad de recargar la página
    Examples: Reducciones de espacio libre tras aceptar carga
      | espacio-libre | nueva-carga | espacio-resultante |
      | 3.0           | 1.5         | 1.5                |
      | 4.0           | 2.0         | 2.0                |