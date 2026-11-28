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
-- package org.allbinary.media.image

local ImageCompleteUtil = {}
package.loaded["org.allbinary.media.image.ImageCompleteUtil"] = ImageCompleteUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Image = java_lazy("javax.microedition.lcdui.Image")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local PlaynImage = java_lazy("org.microemu.device.playn.PlaynImage")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ImageCompleteUtil is declared before the requires
ImageCompleteUtil.__index = ImageCompleteUtil
ImageCompleteUtil.className = "ImageCompleteUtil"
ImageCompleteUtil.javaClassName = "org.allbinary.media.image.ImageCompleteUtil"

function ImageCompleteUtil:_init_fields()
    self.ISREADY = "isReady"
    self.COMPLETE = "Image loading complete for: "
end

function ImageCompleteUtil._jinit(self)
    ImageCompleteUtil._init_fields(self)
    return self
end

function ImageCompleteUtil.new()
    return ImageCompleteUtil._jinit(setmetatable({}, ImageCompleteUtil))
end


function ImageCompleteUtil.getInstance()
        return ImageCompleteUtil.instance_f
end


-- throws Exception
function ImageCompleteUtil:waitForImage(image, name)
end


-- throws Exception
function ImageCompleteUtil:isReady(image, name, timeDelayHelper)
        local playnImage = image
        local playnCoreImage = playnImage:getImage()
        if not (playnCoreImage:isReady()) or playnCoreImage:width() + playnCoreImage:height() <= 0 then
            self:handleTimeout(name)
            return false
        end
        if not (image:isReady()) then
            image:init(image:getImage())
            if not (image:isReady()) then
                PreLogUtil.put(require("allbinary_java").to_string("Waiting for Not Ready Image: ") .. require("allbinary_java").to_string(image:getName()), self, self.ISREADY)
            end
        end
        local commonStrings = CommonStrings.getInstance()
        PreLogUtil.put(require("allbinary_java").to_string(self.COMPLETE) .. require("allbinary_java").to_string(image:getName()), self, commonStrings.SUCCESS)
        return true
end


-- throws Exception
function ImageCompleteUtil:handleTimeout(name)
end


-- throws Exception
function ImageCompleteUtil:waitForAll()
end

ImageCompleteUtil.instance_f = ImageCompleteUtil.new()

return ImageCompleteUtil

