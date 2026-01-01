# Verificacion de Rendimiento

Por favor, analiza este proyecto en busca de problemas de rendimiento y oportunidades de optimizacion:

## 1. Analisis de Tamano de Archivos
Verifica archivos que podrian ser demasiado grandes:
```bash
# Encontrar archivos grandes
chs large-files 500  # Archivos con mas de 500 lineas

# Verificar tamano general del proyecto
ch ts size  # Para proyectos Node
find . -name "*.js" -o -name "*.ts" | xargs wc -l | sort -n
```

## 2. Anti-Patrones Comunes de Rendimiento
Busca posibles cuellos de botella:
```bash
# Bucles anidados
chs find-code "for.*for\|while.*while"
chs find-code "\.forEach.*\.forEach\|\.map.*\.map"

# Operaciones sincronas
chs find-code "readFileSync\|execSync\|statSync"

# Operaciones de array ineficientes
chs find-code "\.shift()\|\.unshift()"

# Grandes datos en memoria
chs find-code "JSON\.parse.*readFile\|\.split.*readFile"
```

## 3. Analisis de Bundle e Imports
Verifica dependencias pesadas:
```bash
# Encontrar imports grandes
chs search-imports "moment\|lodash"

# Verificar imports de paquetes completos
chs find-code "import .* from ['\"]\w+['\"]"  # vs imports especificos

# Encontrar imports dinamicos
chs find-code "import(\|require("
```

## 4. Problemas con Async/Promesas
Busca problemas asincrono:
```bash
# Await faltante
chs find-code "async.*{" | xargs grep -L "await"

# Cadenas de promesas que podrian ser async/await
chs find-code "\.then.*\.then\|\.catch.*\.then"

# Potenciales condiciones de carrera
chs find-code "Promise\.all\|Promise\.race"
```

## 5. Riesgos de Fugas de Memoria
Identifica posibles problemas de memoria:
```bash
# Event listeners sin limpieza
chs find-code "addEventListener" | xargs grep -L "removeEventListener"

# Timers sin limpieza
chs find-code "setInterval\|setTimeout" | xargs grep -L "clear"

# Variables globales
chs find-code "^(var\|let\|const).*window\.\|global\."
```

## 6. Generar Informe de Optimizacion
Crea una lista priorizada de:
- **Critico**: Problemas causando problemas de rendimiento inmediatos
- **Alto**: Oportunidades de optimizacion significativas
- **Medio**: Buenas practicas que ayudarian
- **Bajo**: Mejoras deseables

Para cada problema, proporciona:
- El problema y su impacto
- Ubicaciones especificas del codigo
- Solucion recomendada
- Esfuerzo estimado

Enfocate en cambios que tendran un impacto medible!
