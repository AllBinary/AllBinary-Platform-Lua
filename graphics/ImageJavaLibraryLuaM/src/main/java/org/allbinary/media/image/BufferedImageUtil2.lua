-- Generated Code Do Not Modify
-- package org.allbinary.media.image

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BufferedImageUtil2 = {}
BufferedImageUtil2.__index = BufferedImageUtil2
BufferedImageUtil2.className = "BufferedImageUtil2"

function BufferedImageUtil2:_init_fields()
    self.imageUtil = ImageUtil.getInstance()
end

function BufferedImageUtil2.new()
    local self = setmetatable({}, BufferedImageUtil2)
    self:_init_fields()
    return self
end


function BufferedImageUtil2.getInstance()
        return BufferedImageUtil2.instance
end


function BufferedImageUtil2:createSpriteImage(bufferedImageArray)
        local columns = (bufferedImageArray.n or #bufferedImageArray)
        local max = columns
        local rows = 0
        if (bufferedImageArray.n or #bufferedImageArray) < columns then
            columns = (bufferedImageArray.n or #bufferedImageArray)
        end
        rows = (java_idiv((bufferedImageArray.n or #bufferedImageArray), columns))
        if math.fmod((bufferedImageArray.n or #bufferedImageArray), columns) ~= 0 then
            rows = rows + 1
        end
        local bufferedImage = self.imageUtil:create(bufferedImageArray[1]:getWidth(nil) * columns, bufferedImageArray[1]:getHeight(nil) * rows)
        local g = bufferedImage:createGraphics()
        local columnIndex = 0
        local rowIndex = 0
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            if java_idiv(index, max) ~= 0 and math.fmod(index, max) == 0 then
                rowIndex = rowIndex + 1
                columnIndex = 0
            end
            g:drawImage(bufferedImageArray[index + 1], bufferedImageArray[index + 1]:getWidth(nil) * columnIndex, bufferedImageArray[index + 1]:getHeight(nil) * rowIndex, bufferedImageArray[index + 1]:getWidth(nil), bufferedImageArray[index + 1]:getHeight(nil), nil)
            columnIndex = columnIndex + 1
        end
        g:dispose()
        return bufferedImage
end

BufferedImageUtil2.instance = BufferedImageUtil2.new()

return BufferedImageUtil2

