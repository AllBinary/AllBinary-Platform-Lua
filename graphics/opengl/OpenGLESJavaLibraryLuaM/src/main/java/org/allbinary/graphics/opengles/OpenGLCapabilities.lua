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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local GL11 = require("javax.microedition.khronos.opengles.GL11")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local OpenGLESGL10ImageFactory = require("org.allbinary.image.opengles.OpenGLESGL10ImageFactory")
local OpenGLESGL11VBOImageFactory = require("org.allbinary.image.opengles.OpenGLESGL11VBOImageFactory")
local OpenGLImageSpecificFactory = require("org.allbinary.image.opengles.OpenGLImageSpecificFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Tokenizer = require("org.allbinary.logic.string.tokens.Tokenizer")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local OpenGLCapabilities = {}
OpenGLCapabilities.__index = OpenGLCapabilities
OpenGLCapabilities.className = "OpenGLCapabilities"

function OpenGLCapabilities:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.CUSTOM_GL_SURFACE_VIEW = true
    self.stringUtil = StringUtil.getInstance()
    self.initialized = false
    self.glVersionString = self.stringUtil.EMPTY_STRING
    self.glShaderVersionString = self.stringUtil.EMPTY_STRING
    self.shaderVersion = 0
    self.glRenderer = self.stringUtil.EMPTY_STRING
    self.glVendor = self.stringUtil.EMPTY_STRING
    self.glExtensions = self.stringUtil.EMPTY_STRING
    self.possiblyAccelerated = false
    self.acceleratedString = self.stringUtil.EMPTY_STRING
    self.maxTextureSize = 64
    self.VERSION_1_0 = "1.0"
    self.VERSION_1_1 = "1.1"
    self.VERSION_2_0 = "2.0"
    self.VERSION_3_0 = "3.0"
    self.VERSION_3_1 = "3.1"
    self.VERSION_3_2 = "3.2"
    self.VERSION_HIGHER_THAN_EXISTS = "999.999"
    self.VERSION_UNK = "Unk"
    self.GL_EXT_GPU_SHADER_100 = "GL_ARB_shading_language_100"
    self.GL_EXT_GPU_SHADER4 = "GL_EXT_gpu_shader4"
    self.glVersion = self.glVersionString
    self.glInstanceVersion = self.VERSION_UNK
    self.glExtensionDrawTexture = false
    self.glThreedDrawTexture = false
    self.glExtensionGPUShader4 = false
    self.glExtensionGPUShader100 = false
    self.vertexBufferObjectSupport = false
end


function OpenGLCapabilities.getInstance()
        return OpenGLCapabilities.instance
end


function OpenGLCapabilities.new()
    local self = setmetatable({}, OpenGLCapabilities)
    self:_init_fields()
    return self
end


function OpenGLCapabilities:isInitialized()
        return self.initialized
end


function OpenGLCapabilities:requireInitialization()
end


function OpenGLCapabilities:initCapabilities(gl)
        local METHOD_NAME = "initGLCapabilities"
        local try_ok, try_error = pcall(function()
            local features = Features.getInstance()
            local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
            local openGLImageSpecificFactory = OpenGLImageSpecificFactory.getInstance()
            local stringBuffer = StringMaker.new()
            self.glVersionString = gl:glGetString(self.GL10.GL_VERSION)
            local GL_SHADING_LANGUAGE_VERSION = 0x8b8c
            self.glShaderVersionString = gl:glGetString(GL_SHADING_LANGUAGE_VERSION)
            if self.glShaderVersionString == nil then
                self.glShaderVersionString = self.stringUtil.EMPTY_STRING
            end
            local try_ok, try_error = pcall(function()
                if self.glShaderVersionString ~= nil and ((string.find(self.glShaderVersionString, ".", 1, true) or 0) - 1) >= 0 then
                    local startIndex = self.glShaderVersionString:lastIndexOf(" ")
                    if startIndex >= 0 then
                        self.glShaderVersionString = string.sub(self.glShaderVersionString, (startIndex + 1) + 1)
                    end
                    self.shaderVersion = math.tointeger(tonumber(self.glShaderVersionString:replace(CommonSeps.getInstance().PERIOD, StringUtil.getInstance().EMPTY_STRING)))
                end
            end)
            if not try_ok then
                local e = try_error
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, METHOD_NAME, e)
            end
            self.glRenderer = gl:glGetString(self.GL10.GL_RENDERER)
            self.glVendor = gl:glGetString(self.GL10.GL_VENDOR)
            self.glExtensions = gl:glGetString(self.GL10.GL_EXTENSIONS)
            if ((string.find(self.glExtensions, self.GL_EXT_GPU_SHADER_100, 1, true) or 0) - 1) >= 0 then
                self.glExtensionGPUShader100 = true
            else
                self.glExtensionGPUShader100 = false
            end
            if ((string.find(self.glExtensions, self.GL_EXT_GPU_SHADER4, 1, true) or 0) - 1) >= 0 then
                self.glExtensionGPUShader4 = true
            else
                self.glExtensionGPUShader4 = false
            end
            if self.glRenderer == nil then
                self.glRenderer = self.stringUtil.EMPTY_STRING
            end
            if ((string.find(string.lower(self.glRenderer), "pixelflinger", 1, true) or 0) - 1) >= 0 then
                self.acceleratedString = "Probably Not for " .. self.glRenderer
                self.possiblyAccelerated = false
            else
                self.acceleratedString = "Probably for " .. self.glRenderer
                self.possiblyAccelerated = true
            end
            self.glExtensionDrawTexture = false
            if self.glVersionString == nil then
                self.glVersionString = self.stringUtil.EMPTY_STRING
                self.glVersion = self.VERSION_UNK
            elseif ((string.find(self.glVersionString, " 1.0", 1, true) or 0) - 1) >= 0 then
                self.glVersion = self.VERSION_1_0
            elseif ((string.find(self.glVersionString, " 1.1", 1, true) or 0) - 1) >= 0 then
                self.glVersion = self.VERSION_1_1
            else
                self.glVersion = self.VERSION_UNK
            end
            if java_instanceof(gl, GL11) then
                self.glInstanceVersion = self.VERSION_1_1
            elseif java_instanceof(gl, GL10) then
                self.glInstanceVersion = self.VERSION_1_0
            end
            if self.glVendor == nil then
                self.glVendor = self.stringUtil.EMPTY_STRING
            end
            if self.glExtensions == nil then
                self.glExtensions = self.stringUtil.EMPTY_STRING
            end
            if self.possiblyAccelerated then
                PreLogUtil.put(tostring(StringMaker.new():append("VBO:?"):appendboolean((self.glInstanceVersion == self.VERSION_1_1)):append("||"):appendboolean(self:isExtension(openGLFeatureFactory.OPENGL_VERTEX_BUFFER_OBJECT))), self, METHOD_NAME)
                if (self.glInstanceVersion == self.VERSION_1_1 or self:isExtension(openGLFeatureFactory.OPENGL_VERTEX_BUFFER_OBJECT)) then
                    if AndroidUtil.isAndroid() then
                        PreLogUtil.put("VBO implementation was detected, but disabled by default for Android", self, METHOD_NAME)
                    else
                        PreLogUtil.put("VBO implementation was detected, but disabled for now", self, METHOD_NAME)
                    end
                end
            end
            local stringUtil = StringUtil.getInstance()
            if features:isDefault(openGLFeatureFactory.OPENGL_AUTO_SELECT) then
                if self.vertexBufferObjectSupport then
                    openGLImageSpecificFactory:setImageFactory(OpenGLESGL11VBOImageFactory.new())
                else
                    stringBuffer:append("OpenGL is on but ")
                    stringBuffer:append(stringUtil:toString(openGLFeatureFactory.OPENGL_DRAW_TEXTURE))
                    stringBuffer:append(" was not available")
                    PreLogUtil.put(tostring(stringBuffer), self, METHOD_NAME)
                    openGLImageSpecificFactory:setImageFactory(OpenGLESGL10ImageFactory.new())
                end
            else
                stringBuffer:append(stringUtil:toString(openGLFeatureFactory.OPENGL_AUTO_SELECT))
                stringBuffer:append(" is not on")
                PreLogUtil.put(tostring(stringBuffer), self, METHOD_NAME)
                openGLImageSpecificFactory:setImageFactory(OpenGLESGL10ImageFactory.new())
            end
            local maxTextureSizeArray = java_new_array(0, 1)
            gl:glGetIntegerv(self.GL10.GL_MAX_TEXTURE_SIZE, maxTextureSizeArray, 0)
            self.maxTextureSize = maxTextureSizeArray[1]
            self.initialized = true
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, METHOD_NAME, e)
        end
end


function OpenGLCapabilities:isExtension(gameFeature)
        local index = ((string.find(self.glExtensions, gameFeature:getName(), 1, true) or 0) - 1)
        if index >= 0 then
            return true
        else
            return false
        end
end


function OpenGLCapabilities:isGlExtensionDrawTexture()
        self:requireInitialization()
        return self.glExtensionDrawTexture
end


function OpenGLCapabilities:isGlExtensionGPUShader100()
        return self.glExtensionGPUShader100
end


function OpenGLCapabilities:isGlExtensionGPUShader4()
        self:requireInitialization()
        return self.glExtensionGPUShader4
end


function OpenGLCapabilities:getGlVersion()
        self:requireInitialization()
        return self.glVersion
end


function OpenGLCapabilities:getGlVersionString()
        self:requireInitialization()
        return self.glVersionString
end


function OpenGLCapabilities:getGlShaderVersion()
        self:requireInitialization()
        return self.glShaderVersionString
end


function OpenGLCapabilities:isGlThreedDrawTexture()
        self:requireInitialization()
        return self.glThreedDrawTexture
end


function OpenGLCapabilities:getGlRenderer()
        self:requireInitialization()
        return self.glRenderer
end


function OpenGLCapabilities:isVertexBufferObjectSupport()
        self:requireInitialization()
        return self.vertexBufferObjectSupport
end


function OpenGLCapabilities:isTextureSizeValid(widthAndHeight)
        self:requireInitialization()
        if self.maxTextureSize >= widthAndHeight then
            return true
        end
        return false
end


function OpenGLCapabilities:toString()
        local commonSeps = CommonSeps.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("GL_VERSION: ")
        stringBuffer:append(self.glVersionString)
        stringBuffer:append(" GL_SHADING_LANGUAGE_VERSION: ")
        stringBuffer:append(self.glShaderVersionString)
        stringBuffer:append(" GL_RENDERER: ")
        stringBuffer:append(self.glRenderer)
        stringBuffer:append(" GL_VENDOR: ")
        stringBuffer:append(self.glVendor)
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(" Is Accelerated: ")
        stringBuffer:append(self.acceleratedString)
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(" VBO Support: ")
        stringBuffer:appendboolean(self:isVertexBufferObjectSupport())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(" Max Texture Size: ")
        stringBuffer:appendint(self.maxTextureSize)
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(" GL_EXTENSIONS: ")
        local try_ok, try_error = pcall(function()
            local tokenizer = Tokenizer.new(commonSeps.SPACE)
            local list = tokenizer:getTokensFromString(self.glExtensions, BasicArrayListD.new())
            local size = list:size()
            for index = 0, size - 1 do
                stringBuffer:append(commonSeps.NEW_LINE)
                stringBuffer:append(self.stringUtil:toString(list.objectArray[index + 1]))
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.TOSTRING, e)
        end
        return tostring(stringBuffer)
end
OpenGLCapabilities.__tostring = function(self) return self:toString() end

OpenGLCapabilities.instance = OpenGLCapabilities.new()

return OpenGLCapabilities

