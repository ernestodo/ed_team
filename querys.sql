-- Clientes que han comprado más en valor.
SELECT c.idCliente, c.nombre, c.email, SUM(p.precio*f.piezas) AS totalPrecio
FROM facturas f
INNER JOIN clientes c ON (f.idCliente = c.idCliente)
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY c.idCliente, c.nombre, c.email
ORDER BY totalPrecio DESC

-- Clientes que han comprado más en cantidad.
SELECT c.idCliente, c.nombre, c.email, SUM(f.piezas) AS cantidadPiezas
FROM facturas f
INNER JOIN clientes c ON (f.idCliente = c.idCliente)
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY c.idCliente, c.nombre, c.email
ORDER BY cantidadPiezas DESC

-- Productos más vendidos en valor.
SELECT p.idProducto, p.nombre, p.codigo, SUM(p.precio*f.piezas) AS totalPrecio
FROM facturas f
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY p.idProducto, p.nombre, p.codigo
HAVING SUM(p.precio*f.piezas) > 100000
ORDER BY totalPrecio DESC

-- Productos más vendidos en cantidad.
SELECT p.idProducto, p.nombre, p.codigo, SUM(f.piezas) AS cantidadPiezas
FROM facturas f
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY p.idProducto, p.nombre, p.codigo
HAVING SUM(f.piezas) > 150
ORDER BY cantidadPiezas DESC

-- Productos menos vendidos en valor.
SELECT p.idProducto, p.nombre, p.codigo, SUM(p.precio*f.piezas) AS totalPrecio
FROM facturas f
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY p.idProducto, p.nombre, p.codigo
HAVING SUM(p.precio*f.piezas) < 100000
ORDER BY totalPrecio DESC

-- Productos menos vendidos en cantidad.
SELECT p.idProducto, p.nombre, p.codigo, SUM(f.piezas) AS cantidadPiezas
FROM facturas f
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY p.idProducto, p.nombre, p.codigo
HAVING SUM(f.piezas) < 150
ORDER BY cantidadPiezas DESC

-- Valor de las ventas agrupadas por mes.
SELECT MONTHNAME(f.fechaVenta) AS mesVenta, SUM(f.piezas) AS cantidadVentas, SUM(p.precio*f.piezas) AS ventasTotales
FROM facturas f
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY mesVenta
ORDER BY ventasTotales DESC

-- Valor de las ventas agrupadas por producto y mes.
SELECT p.idProducto, p.codigo, MONTHNAME(f.fechaVenta) AS mesVenta, SUM(f.piezas) AS cantidadVentas, SUM(p.precio*f.piezas) AS ventasTotales 
FROM facturas f
INNER JOIN productos p ON (f.idProducto = p.idProducto)
GROUP BY mesVenta, p.idProducto, p.codigo
ORDER BY ventasTotales DESC