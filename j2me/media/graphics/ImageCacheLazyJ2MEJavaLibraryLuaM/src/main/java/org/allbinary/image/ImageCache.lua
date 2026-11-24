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
-- package org.allbinary.image

local ImageCache = {}
package.loaded["org.allbinary.image.ImageCache"] = ImageCache

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

-- local InputStream = require("java.io.InputStream")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local LazyImageRotationAnimation = java_lazy("org.allbinary.animation.image.LazyImageRotationAnimation")
local GameGlobalsFactory = java_lazy("org.allbinary.canvas.GameGlobalsFactory")
local Processor = require("org.allbinary.canvas.Processor")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local ABToGBUtil = java_lazy("org.allbinary.game.canvas.ABToGBUtil")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local GDLazyResources = java_lazy("org.allbinary.game.gd.resource.GDLazyResources")
local GDResources = java_lazy("org.allbinary.game.gd.resource.GDResources")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Memory = java_lazy("org.allbinary.system.Memory")
local BaseImageLoadingProcessor = java_lazy("org.allbinary.thread.BaseImageLoadingProcessor")
local ConcurrentImageLoadingProcessor = java_lazy("org.allbinary.thread.ConcurrentImageLoadingProcessor")
local SynchObject = java_lazy("org.allbinary.thread.SynchObject")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ABSystemWrapper = java_lazy("org.allbinary.logic.ABSystemWrapper")
local ImageCacheBase = require("org.allbinary.image.ImageCacheBase")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table ImageCache is declared before the requires
ImageCache.__index = ImageCache
ImageCache.className = "ImageCache"
ImageCache.javaClassName = "org.allbinary.image.ImageCache"
setmetatable(ImageCache, {__index = ImageCacheBase})
local NotHTMLProcessor = {}
    NotHTMLProcessor.__index = NotHTMLProcessor
    NotHTMLProcessor.className = "NotHTMLProcessor"
    NotHTMLProcessor.javaClassName = "org.allbinary.image.ImageCache$NotHTMLProcessor"
    setmetatable(NotHTMLProcessor, {__index = Processor})
    ImageCache.NotHTMLProcessor = NotHTMLProcessor

    function NotHTMLProcessor._jinit(self)
        java_super_init(Processor, self)
        return self
    end

    function NotHTMLProcessor.new()
        return NotHTMLProcessor._jinit(setmetatable({}, NotHTMLProcessor))
    end
    

    function ImageCache:process()
            self.concurrentImageLoadingProcessor:runTask()
    end
    java_overload(ImageCache, "process", 0)

local NotHTMLEndProcessor = {}
    NotHTMLEndProcessor.__index = NotHTMLEndProcessor
    NotHTMLEndProcessor.className = "NotHTMLEndProcessor"
    NotHTMLEndProcessor.javaClassName = "org.allbinary.image.ImageCache$NotHTMLEndProcessor"
    setmetatable(NotHTMLEndProcessor, {__index = Processor})
    ImageCache.NotHTMLEndProcessor = NotHTMLEndProcessor

    function NotHTMLEndProcessor._jinit(self)
        java_super_init(Processor, self)
        return self
    end

    function NotHTMLEndProcessor.new()
        return NotHTMLEndProcessor._jinit(setmetatable({}, NotHTMLEndProcessor))
    end
    

    function ImageCache:process()
            local progressCanvas = ProgressCanvasFactory.getInstance()
            progressCanvas:endIfPaintedSinceStart()
    end
    java_overload(ImageCache, "process", 0)

local HTMLEndProcessor = {}
    HTMLEndProcessor.__index = HTMLEndProcessor
    HTMLEndProcessor.className = "HTMLEndProcessor"
    HTMLEndProcessor.javaClassName = "org.allbinary.image.ImageCache$HTMLEndProcessor"
    setmetatable(HTMLEndProcessor, {__index = Processor})
    ImageCache.HTMLEndProcessor = HTMLEndProcessor

    function HTMLEndProcessor._jinit(self)
        java_super_init(Processor, self)
        return self
    end

    function HTMLEndProcessor.new()
        return HTMLEndProcessor._jinit(setmetatable({}, HTMLEndProcessor))
    end
    

    function ImageCache:process()
            local size = self.gdResources.currentLayoutRequiredTotal
            if size == 0 then
                local progressCanvas = ProgressCanvasFactory.getInstance()
                progressCanvas:endIfPaintedSinceStart()
            elseif self.totalLoaded > java_idiv(size, 12) then
                local progressCanvas = ProgressCanvasFactory.getInstance()
                progressCanvas:endIfPaintedSinceStart()
                self.endProcessor = NotHTMLEndProcessor.new()
            end
    end
    java_overload(ImageCache, "process", 0)

local FirstProcessor = {}
    FirstProcessor.__index = FirstProcessor
    FirstProcessor.className = "FirstProcessor"
    FirstProcessor.javaClassName = "org.allbinary.image.ImageCache$FirstProcessor"
    setmetatable(FirstProcessor, {__index = Processor})
    ImageCache.FirstProcessor = FirstProcessor

    function FirstProcessor._jinit(self)
        java_super_init(Processor, self)
        return self
    end

    function FirstProcessor.new()
        return FirstProcessor._jinit(setmetatable({}, FirstProcessor))
    end
    

    function ImageCache:process()
            self:firstProcess()
    end
    java_overload(ImageCache, "process", 0)


function ImageCache:_init_fields()
    self.tsUtil = TsUtil.getInstance()
    self.concurrentImageLoadingProcessor = ConcurrentImageLoadingProcessor.new(self)
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.resourceUtil = ResourceUtil.getInstance()
    self.gameGlobalsFactory = GameGlobalsFactory.getInstance()
    self.gdResources = GDResources.getInstance()
    self.loadNowList = BasicArrayListD.new()
    self.loadSoonList = BasicArrayListD.new()
    self.loadList = BasicArrayListD.new()
    self.loadAfterList = BasicArrayListD.new()
    self.lock = SynchObject.new()
    self.firstTime = true
    self.totalLoaded = 0
    self.progressEnded_f = false
    self.hasAnyLazyAnimationFactories = false
    self.processor = FirstProcessor.new()
    self.endProcessor = Processor.getInstance()
    self.LOAD_IMAGE_FOR_ANIMATION = "Load Image Animation"
end


function ImageCache._jinit(self)
    java_super_init(ImageCacheBase, self)
    ImageCache._init_fields(self)
    return self
end

function ImageCache.new(...)
    local self = setmetatable({}, ImageCache)
    ImageCache._jinit(self, ...)
    return self
end


function ImageCache:firstProcess()
        local logUtil = LogUtil.getInstance()
        local isHTML = J2MEUtil.isHTML()
        if isHTML then
            self.processor = Processor.getInstance()
            self.endProcessor = HTMLEndProcessor.new()
        else
            self.processor = NotHTMLProcessor.new()
            self.endProcessor = NotHTMLEndProcessor.new()
            local try_ok, try_error, try_value = pcall(function()
                self:runTask()
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                logUtil:putF(self.commonStrings.EXCEPTION, self, self.commonStrings.END_METHOD_NAME)
            end
        end
end
java_overload(ImageCache, "firstProcess", 0)


function ImageCache:addListener(renderer)
end
java_overload(ImageCache, "addListener", 1)


-- throws Exception
function ImageCache:waitForLoadNow()
        if self.firstTime then
            local abToGBUtil = ABToGBUtil.getInstance()
            local abCanvas = abToGBUtil.abCanvas
            while self.loadNowList:isEmpty() and (not abCanvas:isInitialized() or (abCanvas:isInitialized() and self.hasAnyLazyAnimationFactories)) and not self.progressEnded_f do
                java_sleep(120)
            end
            self.firstTime = false
        end
end
java_overload(ImageCache, "waitForLoadNow", 0)


-- throws Exception
function ImageCache:loadImageForAnimation()
        local lazyImageRotationAnimation = nil
        do -- synchronized (self.lock)
            if self.loadNowList:isEmpty() then
                self.endProcessor:process()
                if self.loadSoonList:isEmpty() then
                    if self.loadAfterList:isEmpty() then
                        if self.firstTime then
                        elseif self.gameGlobalsFactory.newCanvas then
                        else
                            self:loadNextImage()
                        end
                        return
                    else
                        lazyImageRotationAnimation = self.loadAfterList:get(0)
                        if self:loadImageForLazyAnimation(lazyImageRotationAnimation) then
                            self.loadAfterList:remove(lazyImageRotationAnimation)
                        end
                    end
                else
                    lazyImageRotationAnimation = self.loadSoonList:get(0)
                    if self:loadImageForLazyAnimation(lazyImageRotationAnimation) then
                        self.loadSoonList:remove(lazyImageRotationAnimation)
                    end
                end
                return
            end
            lazyImageRotationAnimation = self.loadNowList:get(0)
        end
        if self:loadImageForLazyAnimation(lazyImageRotationAnimation) then
            do -- synchronized (self.lock)
                self.loadNowList:remove(lazyImageRotationAnimation)
            end
            if lazyImageRotationAnimation.layoutIndex ~= 0 then
                local list = self:getAssociated(lazyImageRotationAnimation)
                do -- synchronized (self.lock)
                    local size = list:size()
                    if size > 0 then
                        self.loadSoonList:addAllList(list)
                    end
                end
            end
            local progressCanvas = ProgressCanvasFactory.getInstance()
            local isHTML = J2MEUtil.isHTML()
            if self.loadNowList:isEmpty() and (not isHTML or self.firstTime) then
                progressCanvas:endFromInitialLazyLoadingComplete()
            else
                if math.fmod(self.totalLoaded, 10) == 0 then
                    progressCanvas:addNormalPortion(1, self.LOAD_IMAGE_FOR_ANIMATION)
                end
            end
        end
end
java_overload(ImageCache, "loadImageForAnimation", 0)


-- throws Exception
function ImageCache:loadImages()
        while not self.loadList:isEmpty() or not self.loadNowList:isEmpty() do
            self:loadImageForAnimations()
            self:loadNextImage()
        end
end
java_overload(ImageCache, "loadImages", 0)


-- throws Exception
function ImageCache:loadImageForAnimations()
        while not self.loadNowList:isEmpty() do
            self:loadImageForAnimation()
        end
end
java_overload(ImageCache, "loadImageForAnimations", 0)


-- throws Exception
function ImageCache:loadRemainingAnimations()
        while not self.loadAfterList:isEmpty() or not self.loadNowList:isEmpty() do
            while not self.loadNowList:isEmpty() do
                self:loadImageForAnimation()
            end
            local lazyImageRotationAnimation = nil
            do -- synchronized (self.lock)
                if not self.loadAfterList:isEmpty() then
                    lazyImageRotationAnimation = self.loadAfterList:removeAt(0)
                end
            end
            if lazyImageRotationAnimation ~= nil then
                self:loadImageForLazyAnimation(lazyImageRotationAnimation)
            end
        end
end
java_overload(ImageCache, "loadRemainingAnimations", 0)


-- throws Exception
function ImageCache:loadImageForLazyAnimation(lazyImageRotationAnimation)
        local image = lazyImageRotationAnimation.animationInterfaceFactoryInterface:getImage()
        if self:loadImage(image) then
            lazyImageRotationAnimation:setRealAnimation()
            return true
        end
        return false
end
java_overload(ImageCache, "loadImageForLazyAnimation", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LazyImageRotationAnimation")) end)


-- throws Exception
function ImageCache:loadNextImage()
        local image = nil
        do -- synchronized (self.lock)
            if self.loadList:size() == 0 then
                return
            end
            image = self.loadList:removeAt(0)
        end
        self:loadImage(image)
end
java_overload(ImageCache, "loadNextImage", 0)


-- throws Exception
function ImageCache:loadImage(image)
        if image:isReady() then
            return true
        else
            if image:getImage() ~= nil then
                if image:setReady() then
                    if image:isReady() then
                        self.totalLoaded = self.totalLoaded + 1
                        return true
                    end
                end
            else
                local key = image:getName()
                local image2 = self:creatImage(key)
                if image2:isReady() then
                    self:init(image, image2)
                    return true
                else
                    image:setImage(image2:getImage())
                end
            end
        end
        return false
end
java_overload(ImageCache, "loadImage", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Image")) end)


-- throws Exception
function ImageCache:init(image, image2)
        image:init(image2:getImage())
end
java_overload(ImageCache, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Image")) and (java_a2 == nil or java_is(java_a2, "Image")) end)


-- throws Exception
function ImageCache:creatImage(key)
        local inputStream = self.resourceUtil:getResourceAsStream(key)
        local image = ImageFactory.getInstance():createImageFromInputStream(inputStream)
        image:setName(key)
        return image
end
java_overload(ImageCache, "creatImage", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function ImageCache:get(caller, width, height)
        local foundIndex = self:getIndexWH(width, height)
        local image = self:getFromAvailable(foundIndex, width, height)
        if image == NullImage.NULL_IMAGE then
            self.volume = self.volume + (width * height)
            if self.volume > 32000 then
                self.tsUtil:gc()
                self.volume = 0
            end
            image = self:createImage(caller, width, height)
            if self.nextIndex > (self.widths.n or #self.widths) - 1 then
                if foundIndex == -1 then
                    foundIndex = self.nextIndex
                    self.widths[self.nextIndex + 1] = width
                    self.heights[self.nextIndex + 1] = height
                    self.nextIndex = self.nextIndex + 1
                end
                self.listOfList[foundIndex + 1]:add(image)
            end
        end
        return image
end
java_overload(ImageCache, "get", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" and type(java_a3) == "number" end)


-- throws Exception
function ImageCache:getWithKey(key)
        local image = self:getImage(key)
        if image == NullImage.NULL_IMAGE then
            local inputStream = nil
            local try_ok, try_error, try_value = pcall(function()
                image = self:createImageFromInputStream(key, inputStream)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self.logUtil:put("Exception: Trying Again After GC", self, self.commonStrings.GET, e)
                self.logUtil:putF(tostring(StringMaker.new():append("InputStream: "):append(StringUtil.getInstance():toString(inputStream))), self, self.commonStrings.GET)
                self.tsUtil:gc()
                self.tsUtil:gc()
                self.logUtil:putF(Memory.getInfo(), self, self.commonStrings.GET)
                java_sleep(100)
                image = self:createImageFromInputStream(key, inputStream)
            end
            self.hashtable:put(key, image)
        end
        return image
end
java_overload(ImageCache, "getWithKey", 1)


function ImageCache:getIndex(key)
        local gdResources = GDResources.getInstance()
        local resourceStringArray = gdResources.resourceStringArray
        local size = (resourceStringArray.n or #resourceStringArray)
        for index = 0, size - 1 do
            if resourceStringArray[index + 1] == key then
                return index
            end
        end
        self.logUtil:putF(tostring(StringMaker.new():append("unable to find key: "):append(StringUtil.getInstance():toString(key))), self, self.commonStrings.RUN)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(ImageCache, "getIndex", 1)


-- throws Exception
function ImageCache:createImageFromInputStream(key, inputStream)
        local gdLazyResources = GDLazyResources.getInstance()
        local resourceStringArray = gdLazyResources.requiredResourcesBeforeLoadingArray
        local size = (resourceStringArray.n or #resourceStringArray)
        for index = 0, size - 1 do
            if key == resourceStringArray[index + 1] then
                return self:creatImage(key)
            end
        end
        self:runTask()
        local index = self:getIndex(key)
        local width = gdLazyResources.imageResourceWidthArray[index + 1]
        local height = gdLazyResources.imageResourceHeightArray[index + 1]
        local image = self:createImageLater(key, width, height)
        do -- synchronized (self.lock)
            self.loadList:add(image)
        end
        return image
end
java_overload(ImageCache, "createImageFromInputStream", 2, function(java_a1, java_a2) return true and (java_a2 == nil or java_is(java_a2, "InputStream")) end)


-- throws Exception
function ImageCache:createImageLater(key, width, height)
        return Image.createImageLater(key, width, height)
end
java_overload(ImageCache, "createImageLater", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" and type(java_a3) == "number" end)


function ImageCache:getAssociated(lazyImageRotationAnimation)
        local list = BasicArrayListD.new()
        do -- synchronized (self.lock)
            local lazyImageRotationAnimation2 = nil
            local size = self.loadAfterList:size()
            for index = 0, size - 1 do
                lazyImageRotationAnimation2 = self.loadAfterList:get(index)
                if lazyImageRotationAnimation2.instanceId == lazyImageRotationAnimation.instanceId then
                    list:add(lazyImageRotationAnimation2)
                end
            end
            local size2 = list:size()
            for index = 0, size2 - 1 do
                self.loadAfterList:remove(list:get(index))
            end
        end
        return list
end
java_overload(ImageCache, "getAssociated", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LazyImageRotationAnimation")) end)


function ImageCache:add(lazyImageRotationAnimation)
        do -- synchronized (self.lock)
            self.loadAfterList:add(lazyImageRotationAnimation)
        end
end
java_overload(ImageCache, "add", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LazyImageRotationAnimation")) end)


-- throws Exception
function ImageCache:insertFirst(lazyImageRotationAnimation)
        if self.loadNowList:contains(lazyImageRotationAnimation) then
        else
            do -- synchronized (self.lock)
                self.loadNowList:add(lazyImageRotationAnimation)
                self.loadAfterList:remove(lazyImageRotationAnimation)
            end
        end
        self:runTask()
end
java_overload(ImageCache, "insertFirst", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LazyImageRotationAnimation")) end)


function ImageCache:progressEnded()
        self.progressEnded_f = true
end
java_overload(ImageCache, "progressEnded", 0)


-- throws Exception
function ImageCache:runTask()
        self.processor:process()
end
java_overload(ImageCache, "runTask", 0)


function ImageCache:initProgress()
        if self.firstTime then
            self.firstTime = false
        end
end
java_overload(ImageCache, "initProgress", 0)


function ImageCache:isLazy()
        return true
end
java_overload(ImageCache, "isLazy", 0)

ImageCache.NULL_IMAGE_CACHE = ImageCache.new()

return ImageCache

