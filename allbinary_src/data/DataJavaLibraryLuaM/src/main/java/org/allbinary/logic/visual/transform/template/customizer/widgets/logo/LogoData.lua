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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.logo


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogoData = {}
LogoData.__index = LogoData
LogoData.className = "LogoData"

function LogoData:_init_fields()
    self.NAME = "LOGO_NAME"
    self.IMAGEPATH = "LOGO_IMAGE_PATH"
    self.IMAGEFILENAME = "LOGO_IMAGE_FILE_NAME"
    self.IMAGE = "LOGO_IMAGE"
end


function LogoData.getInstance()
        return LogoData.instance
end


function LogoData.new()
    local self = setmetatable({}, LogoData)
    self:_init_fields()
    return self
end

LogoData.instance = LogoData.new()

return LogoData

