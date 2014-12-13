def eval_block(*args, &blc)
  if block_given?
    blc.call(*args)
  else
    puts "no block given"
  end
end


eval_block(1,2,3,4,5) do |*args|
  args.inject(:+)
end
