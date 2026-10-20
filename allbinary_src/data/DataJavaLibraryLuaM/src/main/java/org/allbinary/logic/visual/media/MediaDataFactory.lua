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
-- package org.allbinary.logic.visual.media


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MediaDataFactory = {}
MediaDataFactory.__index = MediaDataFactory
MediaDataFactory.className = "MediaDataFactory"

function MediaDataFactory:_init_fields()
    self.AVI = MediaData.new("avi")
    self.BMP = MediaData.new("bmp")
    self.CEL = MediaData.new("cel")
    self.FITS = MediaData.new("fits")
    self.FLI = MediaData.new("fli")
    self.GBR = MediaData.new("gbr")
    self.GIF = MediaData.new("gif")
    self.GIH = MediaData.new("gih")
    self.JPG = MediaData.new("jpg")
    self.PIX = MediaData.new("pix")
    self.PNG = MediaData.new("png")
    self.PNM = MediaData.new("pnm")
    self.PSD = MediaData.new("psd")
    self.PSP = MediaData.new("psp")
    self.PS = MediaData.new("ps")
    self.SGI = MediaData.new("SGI")
    self.SWF = MediaData.new("swf")
    self.TGA = MediaData.new("tga")
    self.TIFF = MediaData.new("tiff")
    self.WMF = MediaData.new("wmf")
end

function MediaDataFactory.new()
    local self = setmetatable({}, MediaDataFactory)
    self:_init_fields()
    return self
end


function MediaDataFactory.getInstance()
        return MediaDataFactory.instance
end

MediaDataFactory.instance = MediaDataFactory.new()

return MediaDataFactory

