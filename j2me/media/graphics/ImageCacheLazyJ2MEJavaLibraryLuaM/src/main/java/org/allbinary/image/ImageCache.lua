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

-- local InputStream = require("java.io.InputStream")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local TsUtil = require("org.allbinary.TsUtil")
local LazyImageRotationAnimation = require("org.allbinary.animation.image.LazyImageRotationAnimation")
local GameGlobalsFactory = require("org.allbinary.canvas.GameGlobalsFactory")
local Processor = require("org.allbinary.canvas.Processor")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local ABToGBUtil = require("org.allbinary.game.canvas.ABToGBUtil")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local GDLazyResources = require("org.allbinary.game.gd.resource.GDLazyResources")
local GDResources = require("org.allbinary.game.gd.resource.GDResources")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Memory = require("org.allbinary.system.Memory")
local BaseImageLoadingProcessor = require("org.allbinary.thread.BaseImageLoadingProcessor")
local ConcurrentImageLoadingProcessor = require("org.allbinary.thread.ConcurrentImageLoadingProcessor")
local SynchObject = require("org.allbinary.thread.SynchObject")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")
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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local ImageCache = {}
ImageCache.__index = ImageCache
ImageCache.className = "ImageCache"
setmetatable(ImageCache, {__index = ImageCacheBase})
local NotHTMLProcessor = {}
    NotHTMLProcessor.__index = NotHTMLProcessor
    NotHTMLProcessor.className = "NotHTMLProcessor"
    setmetatable(NotHTMLProcessor, {__index = Processor})
    ImageCache.NotHTMLProcessor = NotHTMLProcessor

    function NotHTMLProcessor.new()
        local self = setmetatable(Processor.new(), NotHTMLProcessor)
        return self
    end
    

    function ImageCache:process()
            self.concurrentImageLoadingProcessor:runTask()
    end

local NotHTMLEndProcessor = {}
    NotHTMLEndProcessor.__index = NotHTMLEndProcessor
    NotHTMLEndProcessor.className = "NotHTMLEndProcessor"
    setmetatable(NotHTMLEndProcessor, {__index = Processor})
    ImageCache.NotHTMLEndProcessor = NotHTMLEndProcessor

    function NotHTMLEndProcessor.new()
        local self = setmetatable(Processor.new(), NotHTMLEndProcessor)
        return self
    end
    

    function ImageCache:process()
            local progressCanvas = ProgressCanvasFactory.getInstance()
            progressCanvas:endIfPaintedSinceStart()
    end

local HTMLEndProcessor = {}
    HTMLEndProcessor.__index = HTMLEndProcessor
    HTMLEndProcessor.className = "HTMLEndProcessor"
    setmetatable(HTMLEndProcessor, {__index = Processor})
    ImageCache.HTMLEndProcessor = HTMLEndProcessor

    function HTMLEndProcessor.new()
        local self = setmetatable(Processor.new(), HTMLEndProcessor)
        return self
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

local FirstProcessor = {}
    FirstProcessor.__index = FirstProcessor
    FirstProcessor.className = "FirstProcessor"
    setmetatable(FirstProcessor, {__index = Processor})
    ImageCache.FirstProcessor = FirstProcessor

    function FirstProcessor.new()
        local self = setmetatable(Processor.new(), FirstProcessor)
        return self
    end
    

    function ImageCache:process()
            self:firstProcess()
    end


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
    self.progressEnded = false
    self.hasAnyLazyAnimationFactories = false
    self.processor = FirstProcessor.new()
    self.endProcessor = Processor.getInstance()
    self.LOAD_IMAGE_FOR_ANIMATION = "Load Image Animation"
end


function ImageCache.new()
    local self = setmetatable(ImageCacheBase.new(), ImageCache)
    self:_init_fields()
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
            local try_ok, try_error = pcall(function()
                self:runTask()
            end)
            if not try_ok then
                local e = try_error
                logUtil:putF(self.commonStrings.EXCEPTION, self, self.commonStrings.END_METHOD_NAME)
            end
        end
end


function ImageCache:addListener(renderer)
end


-- throws Exception
function ImageCache:waitForLoadNow()
        if self.firstTime then
            local abToGBUtil = ABToGBUtil.getInstance()
            local abCanvas = abToGBUtil.abCanvas
            while self.loadNowList:isEmpty() and (not abCanvas:isInitialized() or (abCanvas:isInitialized() and self.hasAnyLazyAnimationFactories)) and not self.progressEnded do
                java_sleep(120)
            end
            self.firstTime = false
        end
end


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


-- throws Exception
function ImageCache:loadImages()
        while not self.loadList:isEmpty() or not self.loadNowList:isEmpty() do
            self:loadImageForAnimations()
            self:loadNextImage()
        end
end


-- throws Exception
function ImageCache:loadImageForAnimations()
        while not self.loadNowList:isEmpty() do
            self:loadImageForAnimation()
        end
end


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


-- throws Exception
function ImageCache:loadImageForLazyAnimation(lazyImageRotationAnimation)
        local image = lazyImageRotationAnimation.animationInterfaceFactoryInterface:getImage()
        if self:loadImage(image) then
            lazyImageRotationAnimation:setRealAnimation()
            return true
        end
        return false
end


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


-- throws Exception
function ImageCache:init(image, image2)
        image:init(image2:getImage())
end


-- throws Exception
function ImageCache:creatImage(key)
        local inputStream = self.resourceUtil:getResourceAsStream(key)
        local image = ImageFactory.getInstance():createImageFromInputStream(inputStream)
        image:setName(key)
        return image
end


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


-- throws Exception
function ImageCache:getWithKey(key)
        local image = self:getImage(key)
        if image == NullImage.NULL_IMAGE then
            local inputStream = nil
            local try_ok, try_error = pcall(function()
                image = self:createImageFromInputStream(key, inputStream)
            end)
            if not try_ok then
                local e = try_error
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
        error(java_exception("RuntimeException"), 0)
end


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


-- throws Exception
function ImageCache:createImageLater(key, width, height)
        return Image.createImageLater(key, width, height)
end


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


function ImageCache:add(lazyImageRotationAnimation)
        do -- synchronized (self.lock)
            self.loadAfterList:add(lazyImageRotationAnimation)
        end
end


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


function ImageCache:progressEnded()
        self.progressEnded = true
end


-- throws Exception
function ImageCache:runTask()
        self.processor:process()
end


function ImageCache:initProgress()
        if self.firstTime then
            self.firstTime = false
        end
end


function ImageCache:isLazy()
        return true
end

ImageCache.NULL_IMAGE_CACHE = ImageCache.new()

return ImageCache

