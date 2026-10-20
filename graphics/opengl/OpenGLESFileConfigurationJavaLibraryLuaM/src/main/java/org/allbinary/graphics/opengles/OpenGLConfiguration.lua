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
-- package org.allbinary.graphics.opengles

-- local Closeable = require("java.io.Closeable")
-- local DataInputStream = require("java.io.DataInputStream")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
local TsUtil = require("org.allbinary.TsUtil")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local FileStreamFactory = require("org.allbinary.logic.io.FileStreamFactory")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local FileFactory = require("org.allbinary.logic.io.file.FileFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local ChangedGameFeatureListener = require("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local Feature = require("org.allbinary.game.configuration.feature.Feature")
local Features = require("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local NullCloseable = require("org.allbinary.logic.io.NullCloseable")

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

local OpenGLConfiguration = {}
OpenGLConfiguration.__index = OpenGLConfiguration
OpenGLConfiguration.className = "OpenGLConfiguration"

function OpenGLConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.FILE = "OpenGLConfiguration.dat"
    self.commonStrings = CommonStrings.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.opengl = false
    self.type = OpenGLFeatureFactory.getInstance().OPENGL_AS_GAME_THREAD
    self.imageColor = OpenGLFeatureFactory.getInstance().IMAGE_COLOR_DEPTH_4444
    self.color = OpenGLFeatureFactory.getInstance().IMAGE_COLOR_DEPTH_4444
    self.versionSelector = OpenGLFeatureFactory.getInstance().OPENGL_AUTO_SELECT
end


function OpenGLConfiguration.getInstance()
        if OpenGLConfiguration.instance == NullUtil.getInstance().NULL_OBJECT then
            OpenGLConfiguration.instance = OpenGLConfiguration.new()
        end
        return OpenGLConfiguration.instance
end


function OpenGLConfiguration.new()
    local self = setmetatable({}, OpenGLConfiguration)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            if FileFactory.getInstance():isFile(self.FILE) then
                self:read()
            else
                self:write()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end


-- throws Exception
function OpenGLConfiguration:read()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        local fileInputStreamFactory = FileStreamFactory.getInstance()
        local fileInputStream = fileInputStreamFactory:getFileInputStreamInstance(StringUtil.getInstance().EMPTY_STRING, self.FILE)
        local dataInputStream = DataInputStream.new(fileInputStream)
        local openGLValue = dataInputStream:readInt()
        if openGLValue == 0 then
            self:setOpenGL(false)
        elseif openGLValue == 1 then
            self:setOpenGL(true)
        else
            error(java_exception("Exception", "Invalid OpenGL Setting"), 0)
        end
        local version = dataInputStream:readUTF()
        if self.tsUtil:compareTo(version, openGLFeatureFactory.OPENGL_AUTO_SELECT:getName()) == 0 then
            self:setVersionSelector(openGLFeatureFactory.OPENGL_AUTO_SELECT)
        elseif self.tsUtil:compareTo(version, openGLFeatureFactory.OPENGL_MINIMUM:getName()) == 0 then
            self:setVersionSelector(openGLFeatureFactory.OPENGL_MINIMUM)
        else
            error(java_exception("Exception", "OpenGLConfiguration: Error reading version selector: " .. version), 0)
        end
        local type = dataInputStream:readUTF()
        if self.tsUtil:compareTo(type, openGLFeatureFactory.OPENGL_AS_GAME_THREAD:getName()) == 0 then
            self:setType(openGLFeatureFactory.OPENGL_AS_GAME_THREAD)
        elseif self.tsUtil:compareTo(type, openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS:getName()) == 0 then
            self:setType(openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS)
        else
            error(java_exception("Exception", "OpenGLConfiguration: Error reading image color"), 0)
        end
        local imageColor = dataInputStream:readUTF()
        if self.tsUtil:compareTo(imageColor, openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444:getName()) == 0 then
            self:setImageColor(openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444)
        elseif self.tsUtil:compareTo(imageColor, openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444:getName()) == 0 then
            self:setImageColor(openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444)
        elseif self.tsUtil:compareTo(imageColor, openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444:getName()) == 0 then
            self:setImageColor(openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444)
        else
            error(java_exception("Exception", "OpenGLConfiguration: Error reading image color: " .. tostring(imageColor)), 0)
        end
        local color = dataInputStream:readUTF()
        if self.tsUtil:compareTo(color, openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444:getName()) == 0 then
            self:setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444)
        elseif self.tsUtil:compareTo(color, openGLFeatureFactory.OPENGL_COLOR_DEPTH_565:getName()) == 0 then
            self:setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_565)
        elseif self.tsUtil:compareTo(color, openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888:getName()) == 0 then
            self:setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888)
        else
            error(java_exception("Exception", "OpenGLConfiguration: Error reading color: " .. tostring(color)), 0)
        end
        PreLogUtil.put("Read Configuration: " .. tostring(self), self, "read")
end


-- throws Exception
function OpenGLConfiguration:write()
        local closeable = NullCloseable.NULL_CLOSEABLE
        local try_ok, try_error = pcall(function()
            PreLogUtil.put("Write Configuration: " .. tostring(self), self, "write")
            local fileInputStreamFactory = FileStreamFactory.getInstance()
            local fileOutputStream = fileInputStreamFactory:getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, self.FILE)
            local dataOutputStream = AbDataOutputStream.new(fileOutputStream)
            closeable = dataOutputStream
            if self:isOpenGL() then
                dataOutputStream:writeInt(1)
            else
                dataOutputStream:writeInt(0)
            end
            dataOutputStream:writeUTF(self:getVersionSelector():getName())
            dataOutputStream:writeUTF(self:getType():getName())
            dataOutputStream:writeUTF(self:getImageColor():getName())
            dataOutputStream:writeUTF(self:getColor():getName())
            dataOutputStream:flush()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
        do -- finally
            StreamUtil.getInstance():close(closeable)
        end
end


-- throws Exception
function OpenGLConfiguration:init()
        local features = Features.getInstance()
        if ChangedGameFeatureListener.getInstance():isChangedFeature(MainFeatureFactory.getInstance().STATIC) then
            local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
            if self:isOpenGL() then
                if features:isFeature(openGLFeatureFactory.OPENGL_2D) or features:isFeature(openGLFeatureFactory.OPENGL_3D) or features:isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) then
                    if not features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
                        self.logUtil:putF("Turning on OpenGL as Default", self, self.commonStrings.INIT)
                        features:addDefault(OpenGLFeatureFactory.getInstance().OPENGL)
                        self.logUtil:putF("Using OpenGL Type Feature: " .. tostring(self:getType()), self, self.commonStrings.INIT)
                        features:addDefault(self:getType())
                        self.logUtil:putF("Using OpenGL ImageColor Feature: " .. tostring(self:getImageColor()), self, self.commonStrings.INIT)
                        features:addDefault(self:getImageColor())
                        self.logUtil:putF("Using OpenGL Color Feature: " .. tostring(self:getColor()), self, self.commonStrings.INIT)
                        features:addDefault(self:getColor())
                        self.logUtil:putF("Using OpenGL Version Selector Feature: " .. tostring(self:getVersionSelector()), self, self.commonStrings.INIT)
                        features:addDefault(self:getVersionSelector())
                    end
                else
                    self.logUtil:putF("OpenGL is enabled, but this game does not support OpenGL (Probably from installing with the same package name from a game that had OpenGL available)", self, self.commonStrings.INIT)
                end
            else
                self.logUtil:putF("OpenGL is Off", self, self.commonStrings.INIT)
            end
        else
            if self:isOpenGL() and not features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
                PreLogUtil.put("OpenGL is set but not Enabled since statics where not cleared (Reboot or Complete exit is Required)", self, self.commonStrings.INIT)
            end
        end
        PreLogUtil.put(tostring(self), self, self.commonStrings.INIT)
end


-- throws Exception
function OpenGLConfiguration:update(gameFeature, colorLocked)
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        local modified = false
        if gameFeature == openGLFeatureFactory.OPENGL then
            if features:isFeature(gameFeature) then
                if not self:isOpenGL() then
                    self:setOpenGL(true)
                    modified = true
                end
            else
                if self:isOpenGL() then
                    self:setOpenGL(false)
                    modified = true
                end
            end
        end
        if gameFeature == openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS or gameFeature == openGLFeatureFactory.OPENGL_AS_GAME_THREAD then
            if features:isFeature(gameFeature) then
                if gameFeature ~= self:getType() then
                    self:setType(gameFeature)
                    modified = true
                end
            end
        end
        if gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444 or gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_565 or gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_8888 then
            if features:isFeature(gameFeature) then
                if self:getImageColor() ~= gameFeature then
                    self:setImageColor(gameFeature)
                    if colorLocked then
                        if gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444 then
                            self:setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444)
                        elseif gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_565 then
                            self:setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_565)
                        elseif gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_8888 then
                            self:setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888)
                        end
                    end
                    modified = true
                end
            end
        end
        if gameFeature == openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444 or gameFeature == openGLFeatureFactory.OPENGL_COLOR_DEPTH_565 or gameFeature == openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888 then
            if features:isFeature(gameFeature) then
                if self:getColor() ~= gameFeature then
                    self:setColor(gameFeature)
                    modified = true
                end
            end
        end
        if gameFeature == openGLFeatureFactory.OPENGL_AUTO_SELECT or gameFeature == openGLFeatureFactory.OPENGL_MINIMUM then
            if features:isFeature(gameFeature) then
                self:setVersionSelector(gameFeature)
            end
            modified = true
        end
        if modified then
            self:write()
        end
end


function OpenGLConfiguration:setOpenGL(opengl)
        self.opengl = opengl
end


function OpenGLConfiguration:isOpenGL()
        return self.opengl
end


function OpenGLConfiguration:setImageColor(imageColor)
        self.imageColor = imageColor
end


function OpenGLConfiguration:getImageColor()
        return self.imageColor
end


function OpenGLConfiguration:setColor(color)
        self.color = color
end


function OpenGLConfiguration:getColor()
        return self.color
end


function OpenGLConfiguration:setVersionSelector(versionSelector)
        self.versionSelector = versionSelector
end


function OpenGLConfiguration:getVersionSelector()
        return self.versionSelector
end


function OpenGLConfiguration:setType(type)
        self.type = type
end


function OpenGLConfiguration:getType()
        return self.type
end


function OpenGLConfiguration:toString()
        local stringBuffer = StringMaker.new()
        local stringUtil = StringUtil.getInstance()
        stringBuffer:append(" isOpenGL: ")
        stringBuffer:appendboolean(self:isOpenGL())
        stringBuffer:append(" VersionSelector: ")
        stringBuffer:append(stringUtil:toString(self:getVersionSelector()))
        stringBuffer:append(" Type: ")
        stringBuffer:append(stringUtil:toString(self:getType()))
        stringBuffer:append(" Image Color: ")
        stringBuffer:append(stringUtil:toString(self:getImageColor()))
        stringBuffer:append(" Color: ")
        stringBuffer:append(stringUtil:toString(self:getColor()))
        return tostring(stringBuffer)
end
OpenGLConfiguration.__tostring = function(self) return self:toString() end

OpenGLConfiguration.instance = NullUtil.getInstance().NULL_OBJECT

return OpenGLConfiguration

