package _go

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestEmptySliceIsNotNil(t *testing.T) {
	a := make([]int, 0, 3)
	assert.NotNil(t, a)
}
