#!/bin/sh

GENERATED_DIR="./TalentWarsFigmaQuestion/SharedResources/Generated"
eval mkdir -p $GENERATED_DIR
eval touch $GENERATED_DIR/Strings+Generated.swift
eval touch $GENERATED_DIR/XCAssets+Generated.swift

swiftgen config run --config swiftgen.yml

