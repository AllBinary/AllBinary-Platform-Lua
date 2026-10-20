-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.media

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local RenderedImage = require("java.awt.image.RenderedImage")
-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ImageUtil = require("org.allbinary.media.image.ImageUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--import com.sun.imageio.plugins.common.ImageUtil;
local MediaUtil = {}
MediaUtil.__index = MediaUtil
MediaUtil.className = "MediaUtil"

function MediaUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function MediaUtil.getInstance()
        return MediaUtil.instance
end


function MediaUtil.new()
    local self = setmetatable({}, MediaUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function MediaUtil:saveImageFile(originalImageFile, newImageFileName, category, mediaData, newWidth, newHeight)
        if originalImageFile == nil or not originalImageFile:isFile() then
            error(java_exception("Exception", "Original Image File Does Not Exist."), 0)
        end
        local bufferedImage = ImageIOUtil.read(originalImageFile)
        if bufferedImage == nil then
            error(java_exception("Exception", "Unable to find ImageReader for this file."), 0)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local hashMap = self:getImageBufferPropertyHashMap(bufferedImage)
            self.logUtil:putF("Image Properties: " .. tostring(hashMap), self, "saveImageFile()")
        end
        local imageFile = AbFile.createAbFile(category .. newImageFileName)
        imageFile:createNewFile()
        local imageUtil = ImageUtil.getInstance()
        local newBufferedImage = imageUtil:createBufferedImageForSave(bufferedImage, newWidth, newHeight)
        local isWritten = ImageIOUtil.write(newBufferedImage, mediaData:getName(), imageFile)
        if not isWritten then
            error(java_exception("Exception", "Unable to write."), 0)
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
        if propertyStringArray ~= nil then
            for index = 0, (propertyStringArray.n or #propertyStringArray) - 1 do
                local propertyObject = bufferedImage:getProperty(propertyStringArray[index + 1])
                hashMap:put(propertyStringArray[index + 1], tostring(propertyObject))
            end
        end
        return hashMap
end

MediaUtil.instance = MediaUtil.new()

return MediaUtil

