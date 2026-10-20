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
-- package org.allbinary.input.automation

local FilePathData = require("org.allbinary.logic.io.file.FilePathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageOutputData = {}
ImageOutputData.__index = ImageOutputData
ImageOutputData.className = "ImageOutputData"


function ImageOutputData.new()
    local self = setmetatable({}, ImageOutputData)
    return self
end

ImageOutputData.SAVE_PATH = tostring(StringMaker.new():append(System.getProperty("user.dir")):appendchar(FilePathData.getInstance().SEPARATORCHAR):append("saves"):appendchar(FilePathData.getInstance().SEPARATORCHAR))

return ImageOutputData

