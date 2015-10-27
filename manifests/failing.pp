class grub_test::failing {
  kernel_parameter { 'audit':
    value    => '1',
    bootmode => 'normal'
  }
}
