--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.image.gui

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local swing = require("javax.swing")
local ImageIcon = require("org.allbinary.image.gui.ImageIcon")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageIconUnique = {}
ImageIconUnique.__index = ImageIconUnique
ImageIconUnique.className = "ImageIconUnique"
setmetatable(ImageIconUnique, {__index = ImageIcon})

function ImageIconUnique:_init_fields()
    self.id = 0
end


function ImageIconUnique.new(bufferedImage, index)
    local self = setmetatable(ImageIcon.new(bufferedImage), ImageIconUnique)
    self:_init_fields()
        -- super(...) made self above
        self:setId(index)
    return self
end


function ImageIconUnique:getId()
        return self.id
end


function ImageIconUnique:setId(id)
        self.id = id
end

return ImageIconUnique

