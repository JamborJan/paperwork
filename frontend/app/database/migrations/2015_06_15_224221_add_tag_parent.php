<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTagParent extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tags', function (Blueprint $table) {
            $table->char('parent_id', 36)->nullable();
        });

        if (Config::get('paperwork.emergency_export') && ((DB::table('migrations')->where('batch', '=', 1)->count()) == Config::get('paperwork.emergency_export_count'))) {
          // we skip this
        } else {
          Schema::table('tags', function (Blueprint $table) {
              $table->foreign('parent_id')->references('id')->on('tags')->onDelete('cascade')->onUpdate('cascade');
          });
        }

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tags', function (Blueprint $table) {
            $table->dropColumn('parent_id');
        });
    }

}
