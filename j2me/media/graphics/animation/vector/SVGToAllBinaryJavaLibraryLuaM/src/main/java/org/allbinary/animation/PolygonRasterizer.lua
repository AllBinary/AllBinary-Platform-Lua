-- Generated Code Do Not Modify
-- package org.allbinary.animation


local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PolygonRasterizer = {}
PolygonRasterizer.__index = PolygonRasterizer
PolygonRasterizer.className = "PolygonRasterizer"

function PolygonRasterizer.new()
    local self = setmetatable({}, PolygonRasterizer)
    return self
end


function PolygonRasterizer.getInstance()
        return PolygonRasterizer.instance
end


function PolygonRasterizer:getPixelBuffer(svgPath, pathX, pathY, pixelBuffer, width, height)
        local pointCount = PathParser.parsePath(svgPath, pathX, pathY, (pathX.n or #pathX))
        for i = 0, (pixelBuffer.n or #pixelBuffer) - 1 do
            pixelBuffer[i + 1] = 0xFFFFFFFF
        end
        PolygonRasterizer.getInstance():fillPolygon(pathX, pathY, pointCount, pixelBuffer, width, height, 0xFFFF00FF)
        return pixelBuffer
end


function PolygonRasterizer:fillPolygon(polyX, polyY, numPoints, buffer, width, height, colorRGB)
        if numPoints < 3 then
            return
        end
        local fixedPoint = FixedPoint.getInstance()
        local x = java_new_array(0, numPoints)
        local y = java_new_array(0, numPoints)
        local minY = height
        local maxY = 0
        for i = 0, numPoints - 1 do
            x[i + 1] = fixedPoint:toInt(polyX[i + 1])
            y[i + 1] = fixedPoint:toInt(polyY[i + 1])
            if y[i + 1] < minY then
                minY = y[i + 1]
            end
            if y[i + 1] > maxY then
                maxY = y[i + 1]
            end
        end
        if minY < 0 then
            minY = 0
        end
        if maxY >= height then
            maxY = height - 1
        end
        local scanlineX = java_new_array(0, numPoints)
        for scanY = minY, maxY do
            local intersectCount = 0
            for i = 0, numPoints - 1 do
                local next = math.fmod((i + 1), numPoints)
                local x1 = x[i + 1]
                local y1 = y[i + 1]
                local x2 = x[next + 1]
                local y2 = y[next + 1]
                if (y1 < scanY and y2 >= scanY) or (y2 < scanY and y1 >= scanY) then
                    if y2 ~= y1 then
                        local interX = x1 + java_idiv((scanY - y1) * (x2 - x1), (y2 - y1))
                        scanlineX[(function() local value = intersectCount intersectCount = value + 1 return value end)() + 1] = interX
                    end
                end
            end
            for i = 0, intersectCount - 1 - 1 do
                for j = i + 1, intersectCount - 1 do
                    if scanlineX[i + 1] > scanlineX[j + 1] then
                        local temp = scanlineX[i + 1]
                        scanlineX[i + 1] = scanlineX[j + 1]
                        scanlineX[j + 1] = temp
                    end
                end
            end
            for i = 0, intersectCount - 1, 2 do
                if i + 1 >= intersectCount then
                    break
                end
                local startX = scanlineX[i + 1]
                local endX = scanlineX[i + 1 + 1]
                if startX < 0 then
                    startX = 0
                end
                if endX >= width then
                    endX = width - 1
                end
                local rowOffset = scanY * width
                for pixelX = startX, endX do
                    buffer[rowOffset + pixelX + 1] = colorRGB
                end
            end
        end
end


function PolygonRasterizer:main(args)
        local width = 100
        local height = 100
        local pathX = java_new_array(0, 200)
        local pathY = java_new_array(0, 200)
        local pixelBuffer = java_new_array(0, width * height)
        local svgPath = "M 32.139812,81.554575 14.450128,74.294372 V 50.000034 25.705697 l 17.73231,-7.268329 C 41.935209,14.439788 49.953112,11.168898 50,11.168723 c 0.04689,-1.74e-4 8.064791,3.270238 17.817562,7.267583 l 17.73231,7.267899 V 50 74.295795 l -17.73231,7.2679 c -9.752771,3.997344 -17.789855,7.264116 -17.860188,7.259492 -0.07033,-0.0046 -8.088235,-3.275499 -17.817562,-7.268612 z"
        PolygonRasterizer.getInstance():getPixelBuffer(svgPath, pathX, pathY, pixelBuffer, width, height)
end

PolygonRasterizer.instance = PolygonRasterizer.new()

return PolygonRasterizer

