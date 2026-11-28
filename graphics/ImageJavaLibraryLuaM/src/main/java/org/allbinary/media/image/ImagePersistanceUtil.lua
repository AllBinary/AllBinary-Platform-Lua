-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.media.image

local ImagePersistanceUtil = {}
package.loaded["org.allbinary.media.image.ImagePersistanceUtil"] = ImagePersistanceUtil

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
local File = java_lazy("java.io.File")
-- local IOException = require("java.io.IOException")
local Iterator = java_lazy("java.util.Iterator")
-- local IIOImage = require("javax.imageio.IIOImage")
-- local ImageIO = require("javax.imageio.ImageIO")
-- local ImageWriteParam = require("javax.imageio.ImageWriteParam")
-- local ImageWriter = require("javax.imageio.ImageWriter")
-- local ImageOutputStream = require("javax.imageio.stream.ImageOutputStream")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFileOutputStream = java_lazy("org.allbinary.logic.io.AbFileOutputStream")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local PNGImageWriter = java_lazy("org.apache.batik.ext.awt.image.codec.png.PNGImageWriter")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

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

-- class table ImagePersistanceUtil is declared before the requires
ImagePersistanceUtil.__index = ImagePersistanceUtil
ImagePersistanceUtil.className = "ImagePersistanceUtil"
ImagePersistanceUtil.javaClassName = "org.allbinary.media.image.ImagePersistanceUtil"

function ImagePersistanceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function ImagePersistanceUtil._jinit(self)
    ImagePersistanceUtil._init_fields(self)
    return self
end

function ImagePersistanceUtil.new()
    return ImagePersistanceUtil._jinit(setmetatable({}, ImagePersistanceUtil))
end


function ImagePersistanceUtil.getInstance()
        return ImagePersistanceUtil.instance_f
end


-- throws Exception
function ImagePersistanceUtil:saveWithBatik(file, bufferedImage)
        local batikPNGImageWriter = PNGImageWriter.new()
        local fileOutputStream = AbFileOutputStream.createFromAbFile(file)
        local try_ok, try_error, try_value = pcall(function()
            batikPNGImageWriter:writeImage(bufferedImage, fileOutputStream)
        end)
        do -- finally
            fileOutputStream:flush()
            StreamUtil.getInstance():close(fileOutputStream)
        end
        if not try_ok then error(try_error, 0) end
        self.logUtil:putF(require("allbinary_java").to_string("Wrote Image: ") .. require("allbinary_java").to_string(file:getAbsolutePath()), self, self.commonStrings.SAVE)
end


function ImagePersistanceUtil:saveWithImageIO_j2_1(filePath, bufferedImage)
        self:saveWithImageIO(File.new(filePath), bufferedImage)
end


function ImagePersistanceUtil:saveWithImageIO_j2_2(file, bufferedImage)
        local writer = nil
        local ios = nil
        local try_ok, try_error, try_value = pcall(function()
            local iter = ImageIO.getImageWritersByFormatName("jpeg")
            if not (iter:hasNext()) then
                self.logUtil:putF("Unable to save image to jpeg file type.", self, self.commonStrings.SAVE)
                do return "__jreturn" end
            end
            writer = iter:next()
            ios = ImageIO.createImageOutputStream(file)
            writer:setOutput(ios)
            local iwp = writer:getDefaultWriteParam()
            iwp:setCompressionMode(ImageWriteParam.MODE_EXPLICIT)
            iwp:setCompressionQuality(0.95)
            writer:write(nil, IIOImage.new(bufferedImage, nil, nil), iwp)
            self.logUtil:putF(require("allbinary_java").to_string("Wrote Image: ") .. require("allbinary_java").to_string(file:getAbsolutePath()), self, self.commonStrings.SAVE)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
        end
        do -- finally
            local try_ok, try_error, try_value = pcall(function()
                if not rawequal(ios, nil) then
                    ios:flush()
                    local try_ok, try_error, try_value = pcall(function()
                        if not rawequal(ios, nil) then
                            self.logUtil:putF(tostring(ios), ios, self.commonStrings.CLOSE)
                            ios:close()
                        end
                    end)
                    if not try_ok then
                        local e = try_error
                        if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                        self.logUtil:put(self.commonStrings.EXCEPTION, ios, self.commonStrings.CLOSE, e)
                    end
                end
                if not rawequal(writer, nil) then
                    writer:dispose()
                end
            end)
            if not try_ok then
                local e2 = try_error
                if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e2)
            end
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function ImagePersistanceUtil:saveWithImageIO(...)
    local count = select("#", ...)
    if count == 2 then return self:saveWithImageIO_j2(...) end
    error("No method saveWithImageIO takes " .. count .. " arguments")
end
ImagePersistanceUtil.saveWithImageIO__jdispatcher = ImagePersistanceUtil.saveWithImageIO
function ImagePersistanceUtil:saveWithImageIO_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "BufferedImage")) then return ImagePersistanceUtil.saveWithImageIO_j2_1(self, ...) end
    return ImagePersistanceUtil.saveWithImageIO_j2_2(self, ...)
end

ImagePersistanceUtil.instance_f = ImagePersistanceUtil.new()

return ImagePersistanceUtil

