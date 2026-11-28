-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.media

local MediaUtil = {}
package.loaded["org.allbinary.logic.visual.media.MediaUtil"] = MediaUtil

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
-- local RenderedImage = require("java.awt.image.RenderedImage")
local HashMap = java_lazy("java.util.HashMap")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local ImageIOUtil = java_lazy("org.allbinary.logic.visual.media.ImageIOUtil")
local MediaData = java_lazy("org.allbinary.logic.visual.media.MediaData")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

--import com.sun.imageio.plugins.common.ImageUtil;
-- class table MediaUtil is declared before the requires
MediaUtil.__index = MediaUtil
MediaUtil.className = "MediaUtil"
MediaUtil.javaClassName = "org.allbinary.logic.visual.media.MediaUtil"

function MediaUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function MediaUtil.getInstance()
        return MediaUtil.instance_f
end


function MediaUtil._jinit(self)
    MediaUtil._init_fields(self)
    return self
end

function MediaUtil.new(...)
    local self = setmetatable({}, MediaUtil)
    MediaUtil._jinit(self, ...)
    return self
end


-- throws Exception
function MediaUtil:saveImageFile(originalImageFile, newImageFileName, category, mediaData, newWidth, newHeight)
        if rawequal(originalImageFile, nil) or not (originalImageFile:isFile()) then
            error(require("java.lang.Exception").new("Original Image File Does Not Exist."), 0)
        end
        local bufferedImage = ImageIOUtil.read(originalImageFile)
        if rawequal(bufferedImage, nil) then
            error(require("java.lang.Exception").new("Unable to find ImageReader for this file."), 0)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local hashMap = self:getImageBufferPropertyHashMap(bufferedImage)
            self.logUtil:putF(require("allbinary_java").to_string("Image Properties: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "saveImageFile()")
        end
        local imageFile = AbFile.createAbFile(require("allbinary_java").to_string(category) .. require("allbinary_java").to_string(newImageFileName))
        imageFile:createNewFile()
        local imageUtil = ImageUtil.getInstance()
        local newBufferedImage = imageUtil:createBufferedImageForSave(bufferedImage, newWidth, newHeight)
        local isWritten = ImageIOUtil.write(newBufferedImage, mediaData:getName(), imageFile)
        if not (isWritten) then
            error(require("java.lang.Exception").new("Unable to write."), 0)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local commonLabels = CommonLabels.getInstance()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Get Path: ")
            stringBuffer:append(originalImageFile:getPath())
            stringBuffer:append("\nNewImageFileName: ")
            stringBuffer:append(newImageFileName)
            stringBuffer:append("\nCategory: ")
            stringBuffer:append(category)
            stringBuffer:append("\nSave File Type: ")
            stringBuffer:append(mediaData:getName())
            stringBuffer:append("\nNew"):append(commonLabels.WIDTH_LABEL)
            stringBuffer:appendint(newWidth)
            stringBuffer:append("\nNew"):append(commonLabels.HEIGHT_LABEL)
            stringBuffer:appendint(newHeight)
            stringBuffer:append("\nFile Length: ")
            stringBuffer:appendlong(originalImageFile:length())
            stringBuffer:append("\nNew File Length: ")
            stringBuffer:appendlong(imageFile:length())
            self.logUtil:putF(tostring(stringBuffer), self, "saveImageFile()")
        end
end


function MediaUtil.getImageBufferPropertyHashMap(bufferedImage)
        local hashMap = StdUtil.getInstance():createHashMap()
        local propertyStringArray = bufferedImage:getPropertyNames()
        if not rawequal(propertyStringArray, nil) then
            for index = 0, (propertyStringArray.n or #propertyStringArray) - 1 do
                local propertyObject = bufferedImage:getProperty(propertyStringArray[index + 1])
                hashMap:put(propertyStringArray[index + 1], tostring(propertyObject))
            end
        end
        return hashMap
end

MediaUtil.instance_f = MediaUtil.new()

return MediaUtil

