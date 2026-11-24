-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

local OpenGLUtil = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLUtil"] = OpenGLUtil

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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local LoadTextures = java_lazy("org.allbinary.device.LoadTextures")
local OpenGLESGraphics = java_lazy("org.allbinary.device.OpenGLESGraphics")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local RendererStrings = java_lazy("org.allbinary.graphics.opengles.renderer.RendererStrings")
local PreResourceImageUtil = java_lazy("org.allbinary.image.PreResourceImageUtil")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")
local OpenGLImageCache = java_lazy("org.allbinary.image.opengles.OpenGLImageCache")
local OpenGLImageCacheFactory = java_lazy("org.allbinary.image.opengles.OpenGLImageCacheFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local SynchObject = java_lazy("org.allbinary.thread.SynchObject")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local OpenGLCapabilities = java_lazy("org.allbinary.graphics.opengles.OpenGLCapabilities")
local OpenGLLogUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLLogUtil")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table OpenGLUtil is declared before the requires
OpenGLUtil.__index = OpenGLUtil
OpenGLUtil.className = "OpenGLUtil"
OpenGLUtil.javaClassName = "org.allbinary.graphics.opengles.OpenGLUtil"

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

function OpenGLUtil._jinit(self)
    OpenGLUtil._init_fields(self)
    return self
end

function OpenGLUtil.new()
    return OpenGLUtil._jinit(setmetatable({}, OpenGLUtil))
end


function OpenGLUtil.getInstance()
        return OpenGLUtil.instance_f
end


function OpenGLUtil:onSurfaceCreated_j1(gl)
        local try_ok, try_error, try_value = pcall(function()
            if not self.created then
                self.created = true
                PreLogUtil.put(tostring(CommonLabels.getInstance().START_LABEL) .. tostring(OpenGLCapabilities.getInstance()), self, self.renderStrings.ON_SURFACE_CREATED)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.renderStrings.ON_SURFACE_CREATED, e)
        end
end


function OpenGLUtil:onSurfaceCreated_j2(gl, loadTextures)
        local try_ok, try_error, try_value = pcall(function()
            loadTextures:load(gl)
            OpenGLLogUtil.getInstance():logError(gl)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.renderStrings.ON_SURFACE_CREATED, e)
        end
end
function OpenGLUtil:onSurfaceCreated(...)
    local count = select("#", ...)
    if count == 1 then return self:onSurfaceCreated_j1(...) end
    if count == 2 then return self:onSurfaceCreated_j2(...) end
    error("No method onSurfaceCreated takes " .. count .. " arguments")
end
OpenGLUtil.onSurfaceCreated__jdispatcher = OpenGLUtil.onSurfaceCreated


-- throws Exception
function OpenGLUtil:onSurfaceChanged(gl, graphics)
        if not self.surfaceCreatedAndInitialized then
            graphics:init()
            self.surfaceCreatedAndInitialized = true
        end
        graphics:update()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:update(graphics)
        ;(OpenGLImageCacheFactory.getInstance()):update(gl)
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
            image:set(gl)
        end
end

OpenGLUtil.instance_f = OpenGLUtil.new()

return OpenGLUtil

