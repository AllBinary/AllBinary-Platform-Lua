-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.media.image

-- local BufferedImage = require("java.awt.image.BufferedImage")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local SpriteSplitterUtil = {}
SpriteSplitterUtil.__index = SpriteSplitterUtil
SpriteSplitterUtil.className = "SpriteSplitterUtil"

function SpriteSplitterUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.ANIMATIONS_LABELS = {"Row Total:", "Column Total:", "Column Total:", "Row Total:", "Column Total:", "Row Total:"}
    self.DIRECTIONAL_ANIMATIONS = "Directional DLRU"
    self.HORIZONTAL_ANIMATIONS = "Horizontal Animations"
    self.HORIZONTAL_SPRITE = "Horizontal A=R=Y F=C=X"
    self.ROW_NAME = {"idle", "walk", "attack", "defeat"}
    self._ROW = "_row"
end

function SpriteSplitterUtil.new()
    local self = setmetatable({}, SpriteSplitterUtil)
    self:_init_fields()
    return self
end


function SpriteSplitterUtil.getInstance()
        return SpriteSplitterUtil.instance
end


-- throws Exception
function SpriteSplitterUtil:process(imageProcessorInput, totalFrames, totalAnimations, widthReduction, heightReduction, increaseWidth, increaseHeight, spriteType, visitor)
        local bufferedImage = nil
        local generatedBufferedImageArray = nil
        local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            self.logUtil:putF(spriteType, self, self.commonStrings.RUN)
            if spriteType == self.HORIZONTAL_SPRITE then
                local cellHeight = bufferedImage:getHeight() / totalAnimations
                local cellWidth = bufferedImage:getWidth() / totalFrames
                local columns = totalFrames
                local rows = totalAnimations
                generatedBufferedImageArray = java_new_array(nil, rows, columns)
                self.logUtil:putF("Processing Individual Cells columns: " .. tostring(columns) .. " rows: " .. tostring(rows), self, self.commonStrings.RUN)
                self.logUtil:putF("Processing Individual Cells cellHeight: " .. tostring(cellHeight) .. " cellWidth: " .. tostring(cellWidth), self, self.commonStrings.RUN)
                local imageUtil = ImageUtil.getInstance()
                local nameEnding = nil
                local x = 0
                local y = 0
                for index2 = 0, rows - 1 do
                    y = cellHeight * index2
                    for index3 = 0, columns - 1 do
                        x = cellWidth * index3
                        generatedBufferedImageArray[index2 + 1][index3 + 1] = bufferedImage:getSubimage(x + widthReduction, y + heightReduction, cellWidth - (widthReduction * 2), cellHeight - (heightReduction * 2))
                        if increaseWidth ~= 0 or increaseHeight ~= 0 then
                            generatedBufferedImageArray[index2 + 1][index3 + 1] = imageUtil:createBufferedImageAllowTranslate(generatedBufferedImageArray[index2 + 1][index3 + 1], cellWidth + increaseWidth, cellHeight + increaseHeight, false, true)
                        end
                        nameEnding = tostring(StringMaker.new():appendint(index2):append(self.commonSeps.UNDERSCORE):appendint(index3))
                        visitor:visit(generatedBufferedImageArray[index2 + 1][index3 + 1], nameEnding, index)
                    end
                end
                self.logUtil:putF("Processing Rows from Cells", self, self.commonStrings.RUN)
                local imageUnifierProperties = ImageUnifierProperties.new()
                imageUnifierProperties:setRows(tostring(1))
                imageUnifierProperties:setColumns(tostring(columns))
                local imageUnifierCell = ImageUnifierCell.new(tostring(cellWidth - (2 * widthReduction)), tostring(cellHeight - (2 * heightReduction)))
                imageUnifierProperties:setImageUnifierCell(imageUnifierCell)
                for index2 = 0, rows - 1 do
                    y = cellHeight * index2
                    local tempBufferedImageArray = java_new_array(nil, columns)
                    for index3 = 0, columns - 1 do
                        tempBufferedImageArray[index3 + 1] = generatedBufferedImageArray[index2 + 1][index3 + 1]
                        nameEnding = tostring(StringMaker.new():appendint(index2):append(self.commonSeps.UNDERSCORE):appendint(1):append(self._ROW))
                    end
                    local generatedBufferedImage = ImageUnifierUtil.getInstance():getImage(tempBufferedImageArray, imageUnifierProperties)
                    visitor:visit(generatedBufferedImage, nameEnding, index)
                end
            elseif spriteType == self.HORIZONTAL_ANIMATIONS then
            elseif spriteType == self.DIRECTIONAL_ANIMATIONS then
                local totalFrames2 = 4
                local cellHeight = bufferedImage:getHeight() / totalFrames2
                local cellWidth = bufferedImage:getWidth() / totalAnimations
                local columns = totalAnimations
                local rows = totalFrames2
                generatedBufferedImageArray = java_new_array(nil, rows, columns)
                self.logUtil:putF("Processing Individual Cells for each Direction", self, self.commonStrings.RUN)
                local nameEnding = nil
                local x = 0
                local y = 0
                for index2 = 0, rows - 1 do
                    y = cellHeight * index2
                    for index3 = 0, columns - 1 do
                        x = cellWidth * index3
                        generatedBufferedImageArray[index2 + 1][index3 + 1] = bufferedImage:getSubimage(x + widthReduction, y + heightReduction, cellWidth - (widthReduction * 2), cellHeight - (heightReduction * 2))
                        if increaseWidth ~= 0 or increaseHeight ~= 0 then
                            generatedBufferedImageArray[index2 + 1][index3 + 1] = ImageUtil.getInstance():createBufferedImageAllowTranslate(generatedBufferedImageArray[index2 + 1][index3 + 1], cellWidth + increaseWidth, cellHeight + increaseHeight, false, true)
                        end
                        nameEnding = tostring(StringMaker.new():append(self.commonStrings.DIRECTION_NAME[index2 + 1]):append(self.commonSeps.UNDERSCORE):appendint(index3))
                        visitor:visit(generatedBufferedImageArray[index2 + 1][index3 + 1], nameEnding, index)
                    end
                end
                local imageUnifierProperties = ImageUnifierProperties.new()
                imageUnifierProperties:setRows(tostring(1))
                imageUnifierProperties:setColumns(tostring(columns))
                local imageUnifierCell = ImageUnifierCell.new(tostring(cellWidth - (2 * widthReduction)) + increaseWidth, tostring(cellHeight - (2 * heightReduction) + increaseHeight))
                imageUnifierProperties:setImageUnifierCell(imageUnifierCell)
                self.logUtil:putF("Processing Rows from Cells for each Direction", self, self.commonStrings.RUN)
                for index2 = 0, rows - 1 do
                    y = cellHeight * index2
                    local tempBufferedImageArray = java_new_array(nil, columns)
                    for index3 = 0, columns - 1 do
                        tempBufferedImageArray[index3 + 1] = generatedBufferedImageArray[index2 + 1][index3 + 1]
                        nameEnding = tostring(StringMaker.new():append(self.commonStrings.DIRECTION_NAME[index2 + 1]):append(self.commonSeps.UNDERSCORE):appendint(1):append(self._ROW))
                    end
                    local generatedBufferedImage = ImageUnifierUtil.getInstance():getImage(tempBufferedImageArray, imageUnifierProperties)
                    visitor:visit(generatedBufferedImage, nameEnding, index)
                end
            end
        end
end

SpriteSplitterUtil.instance = SpriteSplitterUtil.new()

return SpriteSplitterUtil

