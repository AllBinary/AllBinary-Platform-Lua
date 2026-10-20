-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local LoadTextures = require("org.allbinary.device.LoadTextures")
local OpenGLESGraphics = require("org.allbinary.device.OpenGLESGraphics")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local RendererStrings = require("org.allbinary.graphics.opengles.renderer.RendererStrings")
local PreResourceImageUtil = require("org.allbinary.image.PreResourceImageUtil")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local OpenGLImageCache = require("org.allbinary.image.opengles.OpenGLImageCache")
local OpenGLImageCacheFactory = require("org.allbinary.image.opengles.OpenGLImageCacheFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local SynchObject = require("org.allbinary.thread.SynchObject")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLUtil = {}
OpenGLUtil.__index = OpenGLUtil
OpenGLUtil.className = "OpenGLUtil"

function OpenGLUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.renderStrings = RendererStrings.getInstance()
    self.canvasStrings = CanvasStrings.getInstance()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.preResourceImageUtil = PreResourceImageUtil.getInstance()
    self.lockObject = SynchObject.new()
    self.anyType = SynchObject.new()
    self.list = BasicArrayListD.new()
    self.runnableList = BasicArrayListD.new()
    self.created = false
    self.surfaceCreatedAndInitialized = false
end

function OpenGLUtil.new()
    local self = setmetatable({}, OpenGLUtil)
    self:_init_fields()
    return self
end


function OpenGLUtil.getInstance()
        return OpenGLUtil.instance
end


function OpenGLUtil:onSurfaceCreated(gl)
        local try_ok, try_error = pcall(function()
            if not self.created then
                self.created = true
                PreLogUtil.put(tostring(CommonLabels.getInstance().START_LABEL) .. tostring(OpenGLCapabilities.getInstance()), self, self.renderStrings.ON_SURFACE_CREATED)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.renderStrings.ON_SURFACE_CREATED, e)
        end
end


-- Java overloaded method: Lua keeps the last definition
function OpenGLUtil:onSurfaceCreated(gl, loadTextures)
        local try_ok, try_error = pcall(function()
            loadTextures:load(gl)
            OpenGLLogUtil.getInstance():logError(gl)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.renderStrings.ON_SURFACE_CREATED, e)
        end
end


-- throws Exception
function OpenGLUtil:onSurfaceChanged(gl, graphics)
        if not self.surfaceCreatedAndInitialized then
            graphics:init()
            self.surfaceCreatedAndInitialized = true
        end
        graphics:update()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:update(graphics)
        (OpenGLImageCacheFactory.getInstance()):update(gl)
        self:processRunnables()
        self:set(gl)
end


function OpenGLUtil:addImage(image)
        local encapsulateImage = self.preResourceImageUtil:encapsulate(image)
        if encapsulateImage ~= image then
            do -- synchronized (self.anyType)
                self.list:add(encapsulateImage)
            end
            return encapsulateImage
        end
        return image
end


function OpenGLUtil:clear()
        do -- synchronized (self.anyType)
            self.list:clear()
        end
end


function OpenGLUtil:addRunnable(runnable)
        do -- synchronized (self.lockObject)
            if not self.runnableList:contains(runnable) then
                self.runnableList:add(runnable)
                self.displayInfoSingleton:add(self.canvasStrings.SCALED_IMAGES)
            end
        end
end


function OpenGLUtil:processRunnables()
        do -- synchronized (self.lockObject)
            local runnable = nil
            local size = self.runnableList:size()
            for index = 0, size - 1 do
                runnable = self.runnableList:get(index)
                runnable:run()
            end
            self.runnableList:clear()
        end
end


-- throws Exception
function OpenGLUtil:set(gl)
        local size = self.list:size()
        local image = nil
        for index2 = 0, size - 1 do
            image = self.list:get(index2)
            (image):set(gl)
        end
end

OpenGLUtil.instance = OpenGLUtil.new()

return OpenGLUtil

