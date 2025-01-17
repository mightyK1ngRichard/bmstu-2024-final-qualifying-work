package models

import "errors"

var (
	WrongPassword      = errors.New("WrongPassword")
	NotFound           = errors.New("NotFound")
	InternalError      = errors.New("InternalError")
	ExpiredToken       = errors.New("ExpiredToken")
	NoToken            = errors.New("NoToken")
	NoMetadata         = errors.New("missing metadata")
	MissingFingerprint = errors.New("missing fingerprint")
)
