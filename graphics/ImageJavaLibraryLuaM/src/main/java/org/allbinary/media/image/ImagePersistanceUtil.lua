-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.media.image

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local File = require("java.io.File")
-- local IOException = require("java.io.IOException")
-- local Iterator = require("java.util.Iterator")
-- local IIOImage = require("javax.imageio.IIOImage")
-- local ImageIO = require("javax.imageio.ImageIO")
-- local ImageWriteParam = require("javax.imageio.ImageWriteParam")
-- local ImageWriter = require("javax.imageio.ImageWriter")
-- local ImageOutputStream = require("javax.imageio.stream.ImageOutputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFileOutputStream = require("org.allbinary.logic.io.AbFileOutputStream")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local PNGImageWriter = require("org.apache.batik.ext.awt.image.codec.png.PNGImageWriter")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImagePersistanceUtil = {}
ImagePersistanceUtil.__index = ImagePersistanceUtil
ImagePersistanceUtil.className = "ImagePersistanceUtil"

function ImagePersistanceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function ImagePersistanceUtil.new()
    local self = setmetatable({}, ImagePersistanceUtil)
    self:_init_fields()
    return self
end


function ImagePersistanceUtil.getInstance()
        return ImagePersistanceUtil.instance
end


-- throws Exception
function ImagePersistanceUtil:saveWithBatik(file, bufferedImage)
        local batikPNGImageWriter = PNGImageWriter.new()
        local fileOutputStream = AbFileOutputStream.createFromAbFile(file)
        local try_ok, try_error = pcall(function()
            batikPNGImageWriter:writeImage(bufferedImage, fileOutputStream)
        end)
        do -- finally
            fileOutputStream:flush()
            StreamUtil.getInstance():close(fileOutputStream)
        end
        if not try_ok then error(try_error, 0) end
        self.logUtil:putF("Wrote Image: " .. tostring(file:getAbsolutePath()), self, self.commonStrings.SAVE)
end


function ImagePersistanceUtil:saveWithImageIO(filePath, bufferedImage)
        self:saveWithImageIO(File.new(filePath), bufferedImage)
end


-- Java overloaded method: Lua keeps the last definition
function ImagePersistanceUtil:saveWithImageIO(file, bufferedImage)
        local writer = nil
        local ios = nil
        local try_ok, try_error = pcall(function()
            local iter = ImageIO.getImageWritersByFormatName("jpeg")
            if not iter:hasNext() then
                self.logUtil:putF("Unable to save image to jpeg file type.", self, self.commonStrings.SAVE)
                return
            end
            writer = iter:next()
            ios = ImageIO.createImageOutputStream(file)
            writer:setOutput(ios)
            local iwp = writer:getDefaultWriteParam()
            iwp:setCompressionMode(ImageWriteParam.MODE_EXPLICIT)
            iwp:setCompressionQuality(0.95)
            writer:write(nil, IIOImage.new(bufferedImage, nil, nil), iwp)
            self.logUtil:putF("Wrote Image: " .. tostring(file:getAbsolutePath()), self, self.commonStrings.SAVE)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
        end
        do -- finally
            local try_ok, try_error = pcall(function()
                if ios ~= nil then
                    ios:flush()
                    local try_ok, try_error = pcall(function()
                        if ios ~= nil then
                            self.logUtil:putF(tostring(ios), ios, self.commonStrings.CLOSE)
                            ios:close()
                        end
                    end)
                    if not try_ok then
                        local e = try_error
                        self.logUtil:put(self.commonStrings.EXCEPTION, ios, self.commonStrings.CLOSE, e)
                    end
                end
                if writer ~= nil then
                    writer:dispose()
                end
            end)
            if not try_ok then
                local e2 = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e2)
            end
        end
end

ImagePersistanceUtil.instance = ImagePersistanceUtil.new()

return ImagePersistanceUtil

