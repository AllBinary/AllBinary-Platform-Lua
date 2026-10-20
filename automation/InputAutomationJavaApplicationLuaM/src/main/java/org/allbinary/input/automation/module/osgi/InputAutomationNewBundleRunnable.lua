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
-- package org.allbinary.input.automation.module.osgi

-- local File = require("java.io.File")
-- local FileFilter = require("java.io.FileFilter")
-- local FileInputStream = require("java.io.FileInputStream")
-- local URL = require("java.net.URL")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
-- local JarInputStream = require("java.util.jar.JarInputStream")
-- local Manifest = require("java.util.jar.Manifest")
local Bundle = require("org.osgi.framework.Bundle")
local BundleContext = require("org.osgi.framework.BundleContext")
local Constants = require("org.osgi.framework.Constants")
local InputAutomationBundleActivator = require("bundle.input.automation.InputAutomationBundleActivator")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local FileWrapperUtil = require("org.allbinary.logic.io.file.FileWrapperUtil")
local SubDirectory = require("org.allbinary.logic.io.file.directory.SubDirectory")
local BasicFileFilterUtil = require("org.allbinary.logic.io.file.filter.BasicFileFilterUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
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

local InputAutomationNewBundleRunnable = {}
InputAutomationNewBundleRunnable.__index = InputAutomationNewBundleRunnable
InputAutomationNewBundleRunnable.className = "InputAutomationNewBundleRunnable"

function InputAutomationNewBundleRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.inputAutomationBundleActivator = nil
    self.running = false
    self.fileBasicArrayList = nil
end


function InputAutomationNewBundleRunnable.new(inputAutomationBundleActivator)
    local self = setmetatable({}, InputAutomationNewBundleRunnable)
    self:_init_fields()
        self.inputAutomationBundleActivator = inputAutomationBundleActivator
        self.fileBasicArrayList = BasicArrayListD.new()
    return self
end


-- throws Exception
function InputAutomationNewBundleRunnable:setThread(thread)
end


function InputAutomationNewBundleRunnable:isRunning()
        return self.running
end


function InputAutomationNewBundleRunnable:setRunning(running)
        self.running = running
end


-- throws Exception
function InputAutomationNewBundleRunnable:updateModules()
        self.logUtil:putF(self.commonStrings.START, self, "updateModules")
        local list = self:findNewModules()
        local size = list:size()
        local bundle = nil
        for index = 0, size - 1 do
            bundle = self:install(list:get(index))
            if bundle ~= nil then
                bundle:start(InputAutomationNewBundleRunnable.MODULES_START_LEVEL)
            end
        end
end


-- throws Exception
function InputAutomationNewBundleRunnable:getAllJarSymbolicNameHashMap()
        self.logUtil:putF(self.commonStrings.START, self, "getAllJarSymbolicNameHashMap")
        local hashMap = StdUtil.getInstance():createHashMap()
        local jarFileBasicArrayList = self:getJarModuleFileBasicArrayList()
        self.logUtil:putF("Jar Module Files: " .. tostring(jarFileBasicArrayList), self, "getAllJarSymbolicNameHashMap")
        local size = jarFileBasicArrayList:size()
        local file = nil
        for index = 0, size - 1 do
            file = jarFileBasicArrayList:get(index)
            if not file:isDirectory() then
                local fileInputStream = FileInputStream.new(file)
                local jarInputStream = JarInputStream.new(fileInputStream)
                local manifest = jarInputStream:getManifest()
                if manifest == nil then
                else
                    local symbolicName = manifest:getMainAttributes():getValue(Constants.BUNDLE_SYMBOLICNAME)
                    if symbolicName ~= nil then
                        hashMap:put(symbolicName, URL.new(InputAutomationNewBundleRunnable.FILE + file:getAbsolutePath()))
                    end
                end
            end
        end
        return hashMap
end


function InputAutomationNewBundleRunnable:getJarModuleFileBasicArrayList()
        self.logUtil:putF(self.commonStrings.START, self, "getJarModuleFileBasicArrayList")
        local baseJarPath = System.getProperty(InputAutomationNewBundleRunnable.JAR_DIR_PROP)
        if (string.sub(baseJarPath, 1, #InputAutomationNewBundleRunnable.FILE) == InputAutomationNewBundleRunnable.FILE) then
            baseJarPath = string.sub(baseJarPath, (InputAutomationNewBundleRunnable.FILE:length()) + 1)
        end
        local jarFileFilter = BasicFileFilterUtil.getInstance(".jar")
        local path = baseJarPath .. tostring(InputAutomationNewBundleRunnable.INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH)
        self.logUtil:putF("Path: " .. path, self, "getJarModuleFileBasicArrayList")
        local file = File.new(path)
        self.logUtil:putF("File: " .. tostring(file:getAbsolutePath()) .. " isDirectory: " .. tostring(file:isDirectory()), self, "getJarModuleFileBasicArrayList")
        return SubDirectory.getInstance():search(jarFileFilter, FileWrapperUtil.wrapFile(file))
end


-- throws Exception
function InputAutomationNewBundleRunnable:getInstalledJarSymbolicNameBasicArrayList()
        self.logUtil:putF(self.commonStrings.START, self, "getInstalledJarSymbolicNameBasicArrayList")
        local vector = BasicArrayListD.new()
        local bundleContext = InputAutomationBundleActivator.getBundleContext()
        local bundleArray = bundleContext:getBundles()
        if bundleArray ~= nil then
            self.logUtil:putF("bundleArray: " .. tostring((bundleArray.n or #bundleArray)), self, "getInputAutomationModuleServices")
            for index = 0, (bundleArray.n or #bundleArray) - 1 do
                local bundle = bundleArray[index + 1]
                vector:add(bundle:getSymbolicName())
            end
        end
        return vector
end


-- throws Exception
function InputAutomationNewBundleRunnable:isInstalled(symbolicName)
        self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. symbolicName, self, "isInstalled")
        local list = self:getInstalledJarSymbolicNameBasicArrayList()
        local size = list:size()
        local nextSymbolicName = nil
        for index = 0, size - 1 do
            nextSymbolicName = list:get(index)
            if ((nextSymbolicName < symbolicName and -1) or (nextSymbolicName > symbolicName and 1) or 0) == 0 then
                return true
            end
        end
        return false
end


-- throws Exception
function InputAutomationNewBundleRunnable:findNewModules()
        self.logUtil:putF(self.commonStrings.START, self, "findNewModules")
        local vector = BasicArrayListD.new()
        local hashMap = self:getAllJarSymbolicNameHashMap()
        self.logUtil:putF("All: " .. tostring(hashMap), self, "findNewModules")
        local set = hashMap:keySet()
        local symbolicNameArray = set:toArray()
        local size = (symbolicNameArray.n or #symbolicNameArray)
        for index = 0, size - 1 do
            local symbolicName = symbolicNameArray[index + 1]
            if not self:isInstalled(symbolicName) then
                vector:add(hashMap:get(symbolicName))
            end
        end
        return vector
end


-- throws Exception
function InputAutomationNewBundleRunnable:install(url)
        self.logUtil:putF(CommonLabels.getInstance().START + url, self, "install")
        local bundleContext = InputAutomationBundleActivator.getBundleContext()
        return bundleContext:installBundle(tostring(url))
end


function InputAutomationNewBundleRunnable:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            while self:isRunning() do
                timeHelper:setStartTimeTNT()
                self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
                self:updateModules()
                break
            end
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

InputAutomationNewBundleRunnable.FILE = "file:"
InputAutomationNewBundleRunnable.JAR_DIR_PROP = "org.knopflerfish.gosg.jars"
InputAutomationNewBundleRunnable.INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH = "ia/auto"
InputAutomationNewBundleRunnable.MODULES_START_LEVEL = 8

return InputAutomationNewBundleRunnable

