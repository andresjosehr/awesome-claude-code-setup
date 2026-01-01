# Explorador de Modulos

Por favor, ayudame a entender profundamente este modulo: $MODULE_PATH

Profundidad de exploracion: ${DEPTH:-3}
Areas de enfoque: ${FOCUS:-todos los aspectos}

## Analisis del Modulo

1. **Obtener vision general del modulo**:
   ```bash
   # Mostrar estructura del modulo
   ch ctx focus "$MODULE_PATH" ${DEPTH:-3}

   # Listar todos los archivos
   find "$MODULE_PATH" -type f -name "*.${EXT:-js|ts|py}" | head -20
   ```

2. **Entender limites del modulo**:
   ```bash
   # Encontrar puntos de entrada
   chs find-file "index.*" "$MODULE_PATH"

   # Buscar exportaciones principales
   chs find-code "export|module.exports" "$MODULE_PATH"
   ```

3. **Rastrear dependencias**:
   ```bash
   # Que importa este modulo?
   ch cr imports-of "$MODULE_PATH/index.${EXT:-js}"

   # Generar arbol de dependencias
   ch cr dependency-tree "$MODULE_PATH"

   # Buscar dependencias circulares
   ch cr circular "$MODULE_PATH"
   ```

4. **Encontrar quien usa este modulo**:
   ```bash
   # Quien importa este modulo?
   ch cr imported-by "$MODULE_PATH"

   # Buscar referencias directas
   MODULE_NAME=$(basename "$MODULE_PATH")
   chs find-code "from.*$MODULE_NAME|import.*$MODULE_NAME"
   ```

5. **Localizar pruebas**:
   ```bash
   # Encontrar archivos de prueba
   chs find-file "*.test.*|*.spec.*" "$MODULE_PATH"

   # Encontrar pruebas en otras ubicaciones
   chs find-code "$MODULE_NAME" --include "*.test.*"
   ```

6. **Revisar documentacion**:
   ```bash
   # Encontrar docs
   chs find-file "*.md" "$MODULE_PATH"

   # Buscar documentacion en linea
   chs find-code "^\\s*\\*|^\\s*/\\*\\*|@param|@returns" "$MODULE_PATH"
   ```

7. **Analizar calidad del codigo**:
   ```bash
   # Verificar complejidad
   ch cq large-files 200 "$MODULE_PATH"

   # Encontrar TODOs
   ch cq todos "$MODULE_PATH"
   ```

## Preguntas Clave

1. **Arquitectura**:
   - Cual es la responsabilidad principal del modulo?
   - Como encaja en la arquitectura general?
   - Hay limites e interfaces claros?

2. **Dependencias**:
   - Cuales son las dependencias externas?
   - Hay problemas de acoplamiento preocupantes?
   - Podria este modulo extraerse/reutilizarse facilmente?

3. **Pruebas**:
   - Como es la cobertura de pruebas?
   - Se manejan los casos limite?
   - Son las pruebas mantenibles?

4. **Rendimiento**:
   - Hay cuellos de botella obvios?
   - Se usa async/await apropiadamente?
   - Hay fugas de recursos?

Por favor proporciona un analisis completo de $MODULE_PATH incluyendo su proposito, estructura, dependencias y cualquier recomendacion de mejoras.
