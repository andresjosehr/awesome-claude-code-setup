# Flujo de Trabajo de Desarrollo Guiado por Pruebas (TDD)

Te ayudare a implementar cambios usando Desarrollo Guiado por Pruebas. Este es un flujo de trabajo favorito de Anthropic que asegura codigo de alta calidad y bien probado.

## Vision General del Proceso TDD

Seguire estos pasos estrictamente:
1. **Escribir pruebas que fallen primero** - Basadas en tus requisitos
2. **Verificar que las pruebas fallan** - Confirmar que estamos probando lo correcto
3. **Implementar codigo minimo** - Solo lo suficiente para que las pruebas pasen
4. **Refactorizar si es necesario** - Mejorar codigo manteniendo las pruebas en verde

## Tus Requisitos

Por favor proporciona:
1. **Que funcionalidad/cambio quieres?**
   - Describe el comportamiento esperado
   - Incluye cualquier caso limite a manejar

2. **Ejemplos de prueba (opcional pero util):**
   - Pares de entrada/salida
   - Escenarios de error
   - Requisitos de rendimiento

3. **Preferencias de framework de pruebas:**
   - Que framework de pruebas usa tu proyecto?
   - Algun patron de pruebas especifico a seguir?

## Notas Importantes

- **NO** escribire ningun codigo de implementacion hasta que las pruebas esten escritas y fallando
- **NO** modificare las pruebas una vez que empecemos la implementacion (a menos que haya un bug en la prueba misma)
- Usare los comandos de prueba de tu proyecto para ejecutar pruebas eficientemente
- Identificare el comando de prueba apropiado de la configuracion de tu proyecto

## Proceso que Seguire

### Fase 1: Creacion de Pruebas
```bash
# 1. Analizar estructura de pruebas existente
chs find-file "*.test.*"
chs find-file "*.spec.*"

# 2. Escribir pruebas completas
# 3. Ejecutar pruebas y confirmar que fallan
```

### Fase 2: Implementacion
```bash
# 1. Escribir implementacion minima
# 2. Ejecutar pruebas repetidamente hasta que todas pasen
# 3. Evitar sobreajustar a casos de prueba especificos
```

### Fase 3: Verificacion
```bash
# 1. Ejecutar suite completa de pruebas
# 2. Verificar cobertura de pruebas si esta disponible
# 3. Hacer commit cuando todas las pruebas pasen
```

Comencemos! Que te gustaria implementar usando TDD?
